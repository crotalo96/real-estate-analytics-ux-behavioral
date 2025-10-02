-- Step 1: Calculate averages per estrato
WITH Averages AS (
    SELECT 
        p.estrato,
        AVG(p.area_m2) AS media_area,
        AVG(CAST(p.precio_total AS FLOAT)) AS media_precio
    FROM propiedades p
    GROUP BY p.estrato
),
-- Step 2: Calculate covariance, standard deviations, and count
Stats AS (
    SELECT 
        p.estrato,
        a.media_area,
        a.media_precio,
        STDEV(p.area_m2) AS desv_area,
        STDEV(CAST(p.precio_total AS FLOAT)) AS desv_precio,
        COUNT(*) AS n,
        SUM((p.area_m2 - a.media_area) * (CAST(p.precio_total AS FLOAT) - a.media_precio)) AS covarianza
    FROM propiedades p
    JOIN Averages a ON p.estrato = a.estrato
    GROUP BY p.estrato, a.media_area, a.media_precio
)
-- Step 3: Calculate correlation coefficient
SELECT 
    estrato,
    CASE 
        WHEN desv_area * desv_precio = 0 THEN 0
        ELSE covarianza / (desv_area * desv_precio)
    END AS correlacion_area_precio
FROM Stats
WHERE n > 1
ORDER BY estrato;

-----Correlación entre Área y Precio por Estrato Calcula la correlación entre área y precio total por estrato para confirmar la correlación débil mencionada (0.20).
------Propósito: Confirma la correlación débil entre área y precio (0.20 en promedio), lo que sugiere que factores como ubicación y estrato influyen más, permitiendo identificar propiedades subvaloradas por área.