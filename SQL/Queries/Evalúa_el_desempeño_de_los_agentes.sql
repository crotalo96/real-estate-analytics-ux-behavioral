SELECT 
    p.agente,
    COUNT(p.id_propiedad) AS total_propiedades,
    SUM(CASE WHEN p.disponibilidad = 'Vendido' THEN 1 ELSE 0 END) AS propiedades_vendidas,
    SUM(p.precio_total) AS valor_total,
    AVG(CAST(p.precio_total AS FLOAT)) AS precio_promedio
FROM propiedades p
GROUP BY p.agente
ORDER BY propiedades_vendidas DESC, valor_total DESC;

----Eval�a el desempe�o de los agentes seg�n propiedades vendidas y su valor total.
----Prop�sito: Identifica agentes clave (e.g., con alta tasa de ventas) para posibles alianzas estrat�gicas, especialmente aquellos enfocados en propiedades de alto valor.