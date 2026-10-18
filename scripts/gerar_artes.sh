#!/usr/bin/env bash
# Capa do catálogo + 6 banners do guia (live com selo; grade sem selo) pelo Codex. Uso: scripts/gerar_artes.sh
cd "$(dirname "$0")/.."
R=$PWD; G=~/.claude/skills/projetos-landing-guia/assets/gerar-banner.sh; mkdir -p logs-tmp
node ~/.claude/skills/capa-inema/assets/gerar-capa.cjs --repo "$R" --title "Camada de contexto" --cat "Agentes" \
  --save-raw "$R/guia/assets/hero.png" --gerador auto > logs-tmp/capa.log 2>&1 &
SIDES="escritório claro e moderno: um cofre-arquivo iluminado e aberto, cheio de pastas coloridas, consultado ao mesmo tempo por dois robôs humanoides industriais estilo Tesla Optimus de visor preto, um com detalhes laranja-claro e outro verde-água; uma mulher de camisa azul-clara ao lado"
live(){ bash $G --repo "$R" --sides "$SIDES" --selo "camada-contexto" "$@"; }
grade(){ bash $G --repo "$R" --sides "$SIDES" --estilo grade "$@"; }
live --title "SEU CONTEXTO" --destaque "CONTEXTO" --sub "num lugar só, que é seu" --line "Claude e Codex leem e escrevem no mesmo repositório" --tiles "3 camadas,Arquivos e dados,Onde guardar,Montar,Ligar os dois,O teste" > logs-tmp/b-pt.log 2>&1 &
grade --saida banner-grade --title "SEU CONTEXTO" --destaque "CONTEXTO" --sub "num lugar só, que é seu: Claude e Codex no mesmo repositório" --line "troque a IA, mantenha a fonte" --tiles "3 camadas,Arquivos e dados,Onde guardar,Montar,Ligar os dois,O teste" > logs-tmp/g-pt.log 2>&1 &
wait
live --lang en --saida banner-en --title "YOUR CONTEXT" --destaque "CONTEXT" --sub "in one place you own" --line "Claude and Codex read and write the same repository" --tiles "3 layers,Files and data,Where to keep it,Set up,Connect both,The test" > logs-tmp/b-en.log 2>&1 &
grade --lang en --saida banner-grade-en --title "YOUR CONTEXT" --destaque "CONTEXT" --sub "in one place you own: Claude and Codex on the same repository" --line "change the AI, keep the source" --tiles "3 layers,Files and data,Where to keep it,Set up,Connect both,The test" > logs-tmp/g-en.log 2>&1 &
live --lang es --saida banner-es --title "TU CONTEXTO" --destaque "CONTEXTO" --sub "en un solo lugar, que es tuyo" --line "Claude y Codex leen y escriben en el mismo repositorio" --tiles "3 capas,Archivos y datos,Dónde guardar,Montar,Conectar los dos,La prueba" > logs-tmp/b-es.log 2>&1 &
wait
grade --lang es --saida banner-grade-es --title "TU CONTEXTO" --destaque "CONTEXTO" --sub "en un solo lugar, que es tuyo: Claude y Codex en el mismo repositorio" --line "cambia la IA, conserva la fuente" --tiles "3 capas,Archivos y datos,Dónde guardar,Montar,Conectar los dos,La prueba" > logs-tmp/g-es.log 2>&1
mkdir -p logs-tmp/codex; mv guia/assets/*.codex.log logs-tmp/codex/ 2>/dev/null
echo FIM_ARTES
