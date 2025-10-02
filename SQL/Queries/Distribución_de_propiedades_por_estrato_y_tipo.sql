SELECT 
    p.estrato,
    p.tipo_propiedad,
    COUNT(*) AS total_propiedades,
    AVG(CAST(p.precio_total AS FLOAT)) AS precio_promedio,
    AVG(p.area_m2) AS area_promedio
FROM propiedades p
GROUP BY p.estrato, p.tipo_propiedad
ORDER BY p.estrato, p.tipo_propiedad;

-----Distribuci�n de Propiedades por Estrato y Tipo Muestra la cantidad, precio promedio y �rea promedio de propiedades por estrato y tipo (casa o apartamento).
-----Distribuci�n de Propiedades por Estrato y Tipo muestra la cantidad, precio promedio y �rea promedio de propiedades por estrato y tipo (casa o apartamento).