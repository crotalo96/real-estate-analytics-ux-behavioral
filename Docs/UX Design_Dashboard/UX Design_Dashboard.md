
# 🎨 UX Design – Dashboard de Inteligencia Inmobiliaria

## 1. Arquitectura de Información

Estructura modular para que el inversionista decida en **segundos**:

1.  **Header con filtros rápidos**
    
    -   Perfil de usuario: _“Cazador de gangas”_ (riesgo alto) / _“Inversor premium”_ (riesgo bajo).
        
    -   Selector de zona (comuna, barrio).
        
    -   Filtro de tiempo (últimos 30 días / últimos 6 meses).
        
2.  **Sección principal – Top 5 oportunidades**
    
    -   Tarjetas con:
        
        -   Precio actual vs. precio ancla del barrio.
            
        -   % de subvaloración.
            
        -   Área (m²) destacada si > mediana.
            
        -   Botón **“Más detalles”**.
            
    -   UX: usar **ranking con etiquetas de color** (verde: ganga, azul: premium).
        
3.  **Mapa de calor interactivo**
    
    -   Visualiza **precio/m² por comuna y barrio**.
        
    -   UX: clic en un barrio = despliega ficha con oportunidades listadas.
        
    -   Incluye una línea de tendencia: crecimiento últimos 5 años.
        
4.  **Sección de propiedades premium recientes**
    
    -   Carrusel visual con etiquetas **“Nuevo en el mercado”**.
        
    -   Mostrar fecha de publicación + agente responsable.
        
5.  **Agentes recomendados**
    
    -   Listado tipo “Top sellers”.
        
    -   Cada agente con: propiedades vendidas, ticket promedio, foto/avatar.
        
    -   Sello visual: ✅ “Agente de confianza”.
        
6.  **Insights rápidos (Behavioral Economics)**
    
    -   Banner lateral con bullets simples tipo:
        
        -   “📉 Esta propiedad está 20% por debajo del promedio de su zona.”
            
        -   “🔥 Solo 3 propiedades disponibles en estrato 6.”
            
    -   UX: usar **notificaciones tipo micro-mensajes** que disparen urgencia.
        

----------

## 2. Principios UX aplicados

-   **Reducción de fricción cognitiva** → resumen en Top 5 + visuales claros.
    
-   **Heurísticas de Behavioral Economics**:
    
    -   Ancla → precios comparativos.
        
    -   Escasez → contadores en tiempo real.
        
    -   Autoridad → agentes recomendados.
        
    -   Novedad → etiqueta “Nuevo”.
        
-   **Arquitectura de elección (Choice Architecture)** → perfiles de usuario con journeys distintos.
