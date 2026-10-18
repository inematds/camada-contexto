# Context layer: your business in one place

[![Context layer](guia/assets/banner-en.jpg)](https://inematds.github.io/camada-contexto/guia/en/)

**🇧🇷 [Português](README.md) · 🇺🇸 [English](README.en.md) · 🇪🇸 [Español](README.es.md)**

## What it is

This is a free kit for keeping your business context (what you do, your voice, your audience, your rules) in a private repository that belongs to you, rather than inside an AI app. Claude and ChatGPT/Codex read and write in the same place, so you don't end up with two diverging copies or tied to one company. The kit includes a folder structure, one shared instruction block for both apps, ready-to-use prompts, and a checker that blocks passwords and databases before upload. All you need is a free GitHub account and Claude or ChatGPT.

## 📖 User guide

Complete guide (landing page + walkthrough): **https://inematds.github.io/camada-contexto/guia/en/**

## 🎬 Videos

- Explainer 16:9: https://github.com/inematds/camada-contexto/releases/download/video-v1.0.0/camada-contexto-16x9.mp4
- Reel 9:16: https://github.com/inematds/camada-contexto/releases/download/video-v1.0.0/camada-contexto-reel.mp4
- Players in the guide: https://inematds.github.io/camada-contexto/guia/en/#video

## The three layers

| layer | what it is | example |
|---|---|---|
| top | where the work runs | Claude, Codex, the next AI |
| middle | the bridge | Git, MCP connector, API |
| bottom | what belongs to you | private repository with `contexto/` |

**Files × live data:** documents that change little (business, voice, audience, decisions, skills) belong in the repository, in markdown. Records that change constantly (tasks, clients) belong in a database, such as Supabase.

## How to use

```bash
git clone https://github.com/inematds/camada-contexto
cd camada-contexto
scripts/iniciar.sh ~/minha-empresa-contexto              # creates AGENTS.md, CLAUDE.md, contexto/ and entregas/
python3 scripts/checar_contexto.py ~/minha-empresa-contexto   # blocks passwords, databases, and spreadsheets
tests/run.sh                                              # tests the kit
```

Then:
1. Create a **private** repository on GitHub and push the folder (or use [`prompts/copiar-contexto.md`](traducoes/en/prompts/copiar-contexto.md)).
2. Connect GitHub in Claude and ChatGPT/Codex and paste the same block: [`instrucoes/bloco-projeto.md`](traducoes/en/instrucoes/bloco-projeto.md).
3. Run the two-agent test: [`prompts/teste-dois-agentes.md`](traducoes/en/prompts/teste-dois-agentes.md).
4. Move memory out of the apps: [`prompts/memoria-para-arquivos.md`](traducoes/en/prompts/memoria-para-arquivos.md).

## License

MIT. From [INEMA.CLUB](https://inema.club).
