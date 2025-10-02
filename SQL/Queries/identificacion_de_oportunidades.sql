SELECT 
    p.id_propiedad,
    p.tipo_propiedad,
    b.nombre AS barrio,
    p.estrato,
    p.area_m2,
    p.precio_total,
    p.fecha_publicacion
FROM propiedades p
JOIN barrios b ON p.id_barrio = b.id_barrio
WHERE p.disponibilidad = 'Disponible'
    AND p.estrato IN (5, 6)
    AND p.fecha_publicacion >= DATEADD(DAY, -30, GETDATE())
ORDER BY p.fecha_publicacion DESC, p.precio_total ASC;

----7. Propiedades Recientes en Barrios Premium Busca propiedades disponibles publicadas en los últimos 30 días en barrios de estrato 5-6.
--- Propósito: Identifica oportunidades recientes en barrios premium (e.g., El Poblado, Laureles) para inversionistas conservadores que buscan propiedades de alto valor.