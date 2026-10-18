#!/usr/bin/env bash
# Testa iniciar.sh + checar_contexto.py numa pasta temporária. Uso: tests/run.sh
set -u
cd "$(dirname "$0")/.."
T=$(mktemp -d); ok=0; f=0
chk(){ if eval "$2"; then ok=$((ok+1)); else f=$((f+1)); echo "FALHOU: $1"; fi; }
scripts/iniciar.sh "$T/ctx" > /dev/null
chk "estrutura criada" '[ -f $T/ctx/AGENTS.md ] && [ -f $T/ctx/contexto/negocio.md ] && [ -d $T/ctx/entregas ]'
chk "CLAUDE.md aponta" 'grep -qx "@AGENTS.md" $T/ctx/CLAUDE.md'
chk "gitignore bloqueia banco" 'grep -qx "\*.sqlite" $T/ctx/.gitignore'
python3 scripts/checar_contexto.py "$T/ctx" > "$T/o1.txt"; r=$?
chk "modelo limpo passa (só avisos)" '[ $r -eq 0 ] && grep -q "campos do modelo" $T/o1.txt'
echo "senha = abcdefghij12345" > "$T/ctx/contexto/acesso.md"
python3 scripts/checar_contexto.py "$T/ctx" > "$T/o2.txt"; r=$?
chk "senha bloqueia" '[ $r -eq 1 ] && grep -q "acesso.md:1" $T/o2.txt'
rm "$T/ctx/contexto/acesso.md"; : > "$T/ctx/clientes.sqlite"
python3 scripts/checar_contexto.py "$T/ctx" > "$T/o3.txt"; r=$?
chk "banco bloqueia" '[ $r -eq 1 ] && grep -q "clientes.sqlite" $T/o3.txt'
echo "nunca sobrescreve" > "$T/ctx/contexto/voz.md"; scripts/iniciar.sh "$T/ctx" > /dev/null
chk "não sobrescreve" 'grep -q "nunca sobrescreve" $T/ctx/contexto/voz.md'
echo "$ok ok, $f falhas"; rm -rf "$T"; [ $f -eq 0 ]
