SELECT 
    b.comuna,
    p.estrato,
    AVG(p.precio_m2) AS precio_m2_promedio,
    MIN(p.precio_m2) AS precio_m2_min,
    MAX(p.precio_m2) AS precio_m2_max,
    COUNT(p.id_propiedad) AS total_propiedades
FROM propiedades p
JOIN barrios b ON p.id_barrio = b.id_barrio
GROUP BY b.comuna, p.estrato
ORDER BY b.comuna, p.estrato;

----Tendencias de Precio por m² por Comuna Analiza el precio por m² promedio, mínimo y máximo por comuna y estrato.
----- Propósito: Compara precios por m² entre comunas (e.g., El Poblado vs. Popular) y estratos, destacando oportunidades en comunas con precios bajos pero potencial de crecimiento.