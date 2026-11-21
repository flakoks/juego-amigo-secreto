# Instrucciones para Claude

## Trabajo de diseño: siempre con subagentes

En este proyecto, cualquier trabajo visual (páginas, componentes, rediseños, presentaciones) se hace con los subagentes de diseño de `.claude/agents/`. Esto es una instrucción explícita del dueño del repo para delegar en ellos:

| Tarea | Subagente que construye | Después |
|---|---|---|
| Página web, interfaz, componente o rediseño | `disenador-web` | `critico-de-diseno` |
| Presentación, deck, diapositivas o PPTX a web | `disenador-presentaciones` | `critico-de-diseno` |

Flujo:

1. Pasa al constructor un encargo completo: el objetivo, la audiencia, los archivos implicados, el contenido real disponible y las restricciones. Los subagentes no ven esta conversación.
2. Cuando termine, manda el resultado a `critico-de-diseno`.
3. Si el veredicto es `arreglar` o `rehacer`, vuelve al constructor con la lista de arreglos. Haz como máximo dos rondas y luego informa al usuario de lo que quede abierto.
4. Enseña al usuario las capturas finales.

Para pasos de oficio concretos (asset de imagen, revisión de animación, DESIGN.md), impeccable trae sus propios subagentes: `impeccable-asset-producer`, `impeccable-motion-reviewer`, `impeccable-finish-reviewer`, `impeccable-documenter` e `impeccable-manual-edit-applier`. Úsalos cuando el flujo de la skill `impeccable` los pida.

## Skills de diseño instaladas

Están en `.claude/skills/`; las fuentes y versiones están en `.claude/README.md`.

- `design-taste-frontend` (taste-skill): webs con criterio, sin aspecto de plantilla.
- `impeccable`: dirección, crítica, auditoría y pulido (`/impeccable shape`, `/impeccable critique`, `/impeccable polish`…).
- `ui-ux-pro-max`: base de datos de estilos, paletas, tipografías y reglas UX, junto con `design`, `design-system`, `brand`, `banner-design`, `slides` y `ui-styling`.
- `frontend-slides`: presentaciones HTML con presets y plantillas *bold*.

## Proyecto

App web de Amigo Secreto (desafío de Alura) en HTML, CSS y JavaScript sin dependencias, en `desafio amigo secreto/`. Los textos de la interfaz van en español.
