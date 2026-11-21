# Skills y subagentes de diseño

Son skills de terceros copiadas en el proyecto, como hace `npx skills add … --agent claude-code`, para que funcionen en cualquier sesión de Claude Code que abra este repo, tanto en la nube como en local. Cada carpeta conserva la licencia original en su `LICENSE`.

| Skill(s) | Repositorio | Commit | Licencia |
|---|---|---|---|
| `impeccable` y los agentes `impeccable-*` | [pbakaus/impeccable](https://github.com/pbakaus/impeccable) | `b49177d` (v4.10.0) | Apache-2.0 |
| `design-taste-frontend` | [Leonxlnx/taste-skill](https://github.com/Leonxlnx/taste-skill) | `f6b7657` (v2.5.1) | MIT |
| `ui-ux-pro-max`, `design`, `design-system`, `brand`, `banner-design`, `slides`, `ui-styling` | [nextlevelbuilder/ui-ux-pro-max-skill](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill) | `2de1134` (v2.15.0) | MIT |
| `frontend-slides` | [zarazhangrui/frontend-slides](https://github.com/zarazhangrui/frontend-slides) | `9906a34` | MIT |

Los subagentes propios `disenador-web`, `disenador-presentaciones` y `critico-de-diseno` están en `agents/` y combinan estas skills. El flujo para usarlos está en `CLAUDE.md`, en la raíz del repo.

## Instalarlo para todos los proyectos

`kit-diseno/instalar.sh` copia estas skills, los subagentes y unas instrucciones globales (`kit-diseno/CLAUDE.md`) en `~/.claude`, a nivel de usuario. Así funcionan en cualquier proyecto del equipo donde se ejecute:

```sh
git clone --depth 1 -b ccr-e555d212-ngnwhk https://github.com/flakoks/juego-amigo-secreto.git ~/kit-diseno-claude
sh ~/kit-diseno-claude/kit-diseno/instalar.sh
```

En Windows, ejecútalo desde Git Bash. Puedes repetirlo cuando quieras: reemplaza solo sus propias carpetas y su bloque dentro de `~/.claude/CLAUDE.md`.

## Qué no se instaló

- **Los hooks de impeccable** (`settings.json` del repo original). Ejecutan su binario detector, que se descarga de GitHub Releases y se verifica con SHA-256, después de cada edición y al terminar cada turno. Para activarlos, copia ese `settings.json` en `.claude/settings.json`.
- **La generación de imágenes de ui-ux-pro-max** (logos e iconos con MuAPI, UberLLM, Atlas Cloud o Gemini). Los scripts están, pero solo funcionan si exportas tu propia API key.

La skill `design-taste-frontend` sí trae un hook `Stop` en su propio SKILL.md. Solo actúa mientras hay una construcción armada (`.taste-skill/build.json`) y usa un Chrome headless.

## Actualizar

Vuelve a clonar el repo de origen y reemplaza la carpeta correspondiente. Por ejemplo, para taste-skill la carpeta de origen es `skills/taste-skill/` y se copia en `.claude/skills/design-taste-frontend/`. Después, actualiza esta tabla.
