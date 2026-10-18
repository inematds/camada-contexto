#!/usr/bin/env bash
# Cria a estrutura da camada de contexto numa pasta nova a partir de modelo/.
# Uso: scripts/iniciar.sh <pasta-destino>    (não sobrescreve arquivo que já existe)
set -eu
DEST=${1:?uso: scripts/iniciar.sh <pasta-destino>}
KIT="$(cd "$(dirname "$0")/.." && pwd)"
mkdir -p "$DEST"
cp -r --update=none "$KIT/modelo/." "$DEST/" 2>/dev/null || cp -rn "$KIT/modelo/." "$DEST/"
cat > "$DEST/.gitignore" <<'EOF'
# dado vivo e segredo não entram na camada de contexto
*.db
*.sqlite
*.sqlite3
*.duckdb
*.xlsx
*.csv
.env
*.key
EOF
echo "pronto: $DEST"
echo "próximo: preencha contexto/*.md e rode: python3 $KIT/scripts/checar_contexto.py $DEST"
