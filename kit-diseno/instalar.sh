#!/bin/sh
# Instala el kit (skills de diseño y académicas, subagentes e instrucciones) a nivel de usuario,
# en ~/.claude, para que funcione en TODOS los proyectos de Claude Code.
# Uso: sh kit-diseno/instalar.sh   (en Windows, desde Git Bash)
set -eu
here=$(cd "$(dirname "$0")" && pwd)
src="$here/../.claude"
dest="${CLAUDE_CONFIG_DIR:-$HOME/.claude}"

mkdir -p "$dest/skills" "$dest/agents"
n_skills=0
for d in "$src"/skills/*/; do
  s=$(basename "$d")
  rm -rf "${dest:?}/skills/$s"
  cp -R "$src/skills/$s" "$dest/skills/$s"
  n_skills=$((n_skills + 1))
done
cp "$src"/agents/*.md "$dest/agents/"

# Instrucciones globales: un bloque entre marcadores dentro de ~/.claude/CLAUDE.md.
# Se reemplaza en cada instalación y no toca el resto del archivo.
md="$dest/CLAUDE.md"
start='<!-- kit-diseno:inicio -->'
end='<!-- kit-diseno:fin -->'
tmp="$md.tmp.$$"
if [ -f "$md" ]; then
  awk -v s="$start" -v e="$end" '$0==s{skip=1} !skip{print} $0==e{skip=0}' "$md" > "$tmp"
else
  : > "$tmp"
fi
{ echo "$start"; cat "$here/CLAUDE.md"; echo "$end"; } >> "$tmp"
mv "$tmp" "$md"

n_agents=$(ls "$src"/agents/*.md | wc -l | tr -d ' ')
echo "Kit instalado en $dest: $n_skills skills y $n_agents subagentes."
