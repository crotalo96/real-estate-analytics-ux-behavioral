WITH Percentiles AS (
    SELECT 
        id_barrio,
        PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY CAST(precio_total AS FLOAT)) 
            OVER (PARTITION BY id_barrio) AS precio_percentil_25,
        PERCENTILE_CONT(0.50) WITHIN GROUP (ORDER BY area_m2) 
            OVER (PARTITION BY id_barrio) AS area_mediana,
        ROW_NUMBER() OVER (PARTITION BY id_barrio ORDER BY precio_total) AS rn
    FROM propiedades
    WHERE disponibilidad = 'Disponible'
),
DistinctPercentiles AS (
    SELECT id_barrio, precio_percentil_25, area_mediana
    FROM Percentiles
    WHERE rn = 1
)
SELECT TOP 5
    b.nombre AS barrio,
    b.comuna,
    COUNT(p.id_propiedad) AS propiedades_disponibles,
    AVG(CAST(p.precio_total AS FLOAT)) AS precio_promedio,
    AVG(p.area_m2) AS area_promedio
FROM propiedades p
JOIN barrios b ON p.id_barrio = b.id_barrio
JOIN DistinctPercentiles perc ON p.id_barrio = perc.id_barrio
WHERE p.disponibilidad = 'Disponible'
    AND p.estrato IN (1, 2, 3)
    AND p.precio_total <= perc.precio_percentil_25
    AND p.area_m2 >= perc.area_mediana
GROUP BY b.nombre, b.comuna
ORDER BY propiedades_disponibles DESC, precio_promedio ASC;

----- Top 5 Barrios con Mayor Potencial de Inversión Identifica barrios con propiedades disponibles en el percentil 25% de precio total (subvaloradas) y área por encima de la mediana, priorizando estratos 1-3.
-----Propósito: Encuentra barrios emergentes con propiedades grandes y baratas, ideales para inversionistas agresivos que buscan alto potencial de crecimiento (e.g., Castilla, Manrique).