---
name: prediccion-fallas
description: "Analiza datos de equipos, sensores, producción o mantenimiento para predecir fallas y proyectar tendencias: exploración, variables, modelos validados por tiempo e informe claro."
---

# Predicción de fallas y proyecciones con datos

Conviertes datos operacionales (sensores, registros de mantenimiento, producción o consumo) en una predicción que sirva para decidir: qué equipo revisar, cuándo y con qué confianza. Un modelo que acierta en el papel pero usó información del futuro no sirve en planta. La mayoría de las reglas de abajo existen para evitar eso.

## 1. Definir la pregunta

Aclara con el usuario o con los datos:

- **Qué es una falla:** un código de evento, una parada, una pieza cambiada o un umbral superado.
- **La unidad de análisis:** equipo, línea o componente.
- **El horizonte:** por ejemplo, "¿fallará en los próximos 7 días?".
- **La decisión que apoya y sus costos:** qué cuesta más, una falsa alarma o una falla no detectada.

## 2. Elegir el enfoque

| Situación | Enfoque | Herramientas |
|---|---|---|
| Hay fallas registradas y se quiere saber si fallará en N días | Clasificación con etiqueta por ventana | scikit-learn: gradient boosting o random forest |
| Se quiere estimar cuánto le queda a un equipo (vida útil remanente) | Análisis de supervivencia o regresión sobre el tiempo restante | lifelines o scikit-survival: Kaplan-Meier, Cox |
| Casi no hay fallas registradas | Detección de anomalías y cartas de control | IsolationForest, z-score robusto, cartas de control |
| Se quiere proyectar una métrica (desgaste, consumo, demanda) | Series de tiempo | statsmodels (ETS, SARIMA) o boosting con rezagos |

Si una librería no está instalada, intenta instalarla. Si no se puede, usa la alternativa disponible y dilo.

## 3. Preparar los datos

- Revisa las fechas, la frecuencia de muestreo, los huecos, los duplicados, las unidades y los valores imposibles. Informa cuántas fallas hay por equipo: con pocas fallas, la confianza es baja.
- Variables útiles:
  - medias, desviaciones, mínimos y máximos móviles en varias ventanas;
  - pendientes o tendencias;
  - desviación respecto del comportamiento normal del propio equipo;
  - horas o ciclos de uso;
  - tiempo desde la última mantención;
  - condiciones de operación.
- **Equipos que aún no fallan:** en supervivencia son datos censurados; no los descartes.

## 4. Reglas que evitan resultados falsos

- **Separa por tiempo:** entrena con el pasado y prueba con el futuro. Si el modelo debe servir para equipos nuevos, separa también por equipo. Una división aleatoria en datos temporales infla las métricas.
- **Sin fuga de información:** cada variable debe existir en el momento de predecir. No uses datos posteriores a la falla, como la mantención correctiva o los registros de cierre.
- **Compara siempre con una referencia simple:** "siempre igual que ayer", la media estacional o "nunca falla". Si el modelo no le gana, dilo.
- **Métricas adecuadas al desbalance:** precisión, sensibilidad (recall), PR-AUC y fallas detectadas por cada falsa alarma, no la exactitud. Elige el umbral según los costos del paso 1.
- **Incertidumbre:** da intervalos en las proyecciones y probabilidades calibradas si se usarán para decidir.

## 5. Entregar

Escribe el informe en lenguaje claro para jefaturas y mantenimiento:

1. **Pregunta y datos usados:** periodo, equipos y cantidad de fallas.
2. **Método**, en 3 o 4 líneas.
3. **Resultados frente a la referencia simple**, con las métricas del punto 4.
4. **Ranking de equipos en riesgo:** probabilidad u horizonte estimado y las variables que más pesan (importancia por permutación).
5. **Gráficos clave:**
   - tendencia del sensor con las fallas marcadas;
   - curva de supervivencia o proyección con su intervalo;
   - importancia de variables.
6. **Limitaciones y qué datos convendría registrar** para mejorar.
7. **Acciones recomendadas.**

Una correlación no prueba la causa de una falla. Recomienda validar los hallazgos con el equipo de mantenimiento antes de cambiar planes. Deja el código reproducible junto al informe.
