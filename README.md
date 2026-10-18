# Camada de contexto: o seu negócio num lugar só

[![Camada de contexto](guia/assets/banner.jpg)](https://inematds.github.io/camada-contexto/guia/)

**🇧🇷 [Português](README.md) · 🇺🇸 [English](README.en.md) · 🇪🇸 [Español](README.es.md)**

## O que é

Este é um kit grátis para guardar o contexto do seu negócio (o que você faz, a sua voz, o seu público, as suas regras) num repositório privado que é seu, e não dentro de um app de IA. O Claude e o ChatGPT/Codex leem e escrevem nesse mesmo lugar, então você não fica com duas cópias que se desencontram nem preso a uma empresa. O kit traz a estrutura de pastas, um bloco único de instruções para os dois apps, prompts prontos e um verificador que barra senha e banco de dados antes do envio. Para usar, basta uma conta grátis no GitHub e o Claude ou o ChatGPT.

## 📖 Guia de uso

Guia completo (landing + passo a passo): **https://inematds.github.io/camada-contexto/guia/**

## 🎬 Vídeos

- Explicativo 16:9: https://github.com/inematds/camada-contexto/releases/download/video-v1.0.0/camada-contexto-16x9.mp4
- Reel 9:16: https://github.com/inematds/camada-contexto/releases/download/video-v1.0.0/camada-contexto-reel.mp4
- Players no guia: https://inematds.github.io/camada-contexto/guia/#video

## As três camadas

| camada | o que é | exemplo |
|---|---|---|
| em cima | onde o trabalho roda | Claude, Codex, a próxima IA |
| no meio | a ponte | Git, conector MCP, API |
| embaixo | o que é seu | repositório privado com `contexto/` |

**Arquivo × dado vivo:** documentos que mudam pouco (negócio, voz, público, decisões, skills) ficam no repositório, em markdown. Registros que mudam toda hora (tarefas, clientes) ficam num banco de dados, como o Supabase.

## Como usar

```bash
git clone https://github.com/inematds/camada-contexto
cd camada-contexto
scripts/iniciar.sh ~/minha-empresa-contexto              # cria AGENTS.md, CLAUDE.md, contexto/ e entregas/
python3 scripts/checar_contexto.py ~/minha-empresa-contexto   # barra senha, banco de dados e planilha
tests/run.sh                                              # testa o kit
```

Depois:
1. Crie um repositório **privado** no GitHub e envie a pasta (ou use [`prompts/copiar-contexto.md`](prompts/copiar-contexto.md)).
2. Conecte o GitHub no Claude e no ChatGPT/Codex e cole o mesmo bloco: [`instrucoes/bloco-projeto.md`](instrucoes/bloco-projeto.md).
3. Faça o teste dos dois agentes: [`prompts/teste-dois-agentes.md`](prompts/teste-dois-agentes.md).
4. Tire a memória de dentro dos apps: [`prompts/memoria-para-arquivos.md`](prompts/memoria-para-arquivos.md).

## Licença

MIT. Do [INEMA.CLUB](https://inema.club).
