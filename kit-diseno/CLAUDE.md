# Kit de diseño: uso automático en todos los proyectos

Cualquier trabajo visual (un HTML, una página, una interfaz, un componente, un rediseño o una presentación) se hace con las skills y los subagentes de diseño instalados en `~/.claude`. Es una instrucción explícita del usuario para delegar en estos subagentes sin que tenga que pedirlo cada vez.

| Tarea | Subagente que construye | Después |
|---|---|---|
| HTML, página web, interfaz, componente o rediseño | `disenador-web` | `critico-de-diseno` |
| Presentación, deck, diapositivas o PPTX a web | `disenador-presentaciones` | `critico-de-diseno` |

Flujo:

1. Pasa al constructor un encargo completo: el objetivo, la audiencia, los archivos implicados, el contenido real disponible y las restricciones. Los subagentes no ven la conversación.
2. Cuando termine, manda el resultado a `critico-de-diseno`.
3. Si el veredicto es `arreglar` o `rehacer`, vuelve al constructor con la lista de arreglos. Haz como máximo dos rondas y luego informa al usuario de lo que quede abierto.
4. Enseña al usuario las capturas finales.

Para cambios muy pequeños (un color, un texto, un margen) no hace falta el flujo completo, pero sigue las skills: `impeccable` para criterio y `design-taste-frontend` para el código.

Skills instaladas: `design-taste-frontend` (taste-skill), `impeccable`, `ui-ux-pro-max` (con `design`, `design-system`, `brand`, `banner-design`, `slides` y `ui-styling`) y `frontend-slides`. Los subagentes de oficio de impeccable (`impeccable-*`) se usan cuando su skill los pida.

Los textos de la interfaz van en el idioma del usuario o del proyecto; por defecto, en español.

# Trabajo académico y análisis de datos

| Tarea | Qué usar |
|---|---|
| Revisar un trabajo, informe, artículo o tesis | El subagente `revisor-academico` (aplica `revision-academica`) |
| Anteproyecto, capítulos de tesis, APA 7, matriz de consistencia | La skill `tesis-guia` |
| Presentación de defensa | `tesis-guia` para la estructura y `disenador-presentaciones` (o la skill `pptx`) para las diapositivas |
| Que un texto suene natural y no a IA | La skill `humanizer`, conservando hechos, cifras y citas |
| Proyecciones con datos y predicción de fallas | La skill `prediccion-fallas` |

Nunca inventes fuentes, datos ni resultados: márcalos como pendientes.
