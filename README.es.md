# Capa de contexto: tu negocio en un solo lugar

[![Capa de contexto](guia/assets/banner-es.jpg)](https://inematds.github.io/camada-contexto/guia/es/)

**🇧🇷 [Português](README.md) · 🇺🇸 [English](README.en.md) · 🇪🇸 [Español](README.es.md)**

## Qué es

Este es un kit gratuito para guardar el contexto de tu negocio (qué haces, tu voz, tu público, tus reglas) en un repositorio privado que te pertenece, y no dentro de una app de IA. Claude y ChatGPT/Codex leen y escriben en ese mismo lugar, así que no tienes dos copias que se desincronizan ni dependes de una empresa. El kit incluye la estructura de carpetas, un bloque único de instrucciones para ambas apps, prompts listos y un verificador que bloquea contraseñas y bases de datos antes del envío. Para usarlo, solo necesitas una cuenta gratuita de GitHub y Claude o ChatGPT.

## 📖 Guía de uso

Guía completa (landing + paso a paso): **https://inematds.github.io/camada-contexto/guia/es/**

## 🎬 Videos

- Video explicativo 16:9: https://github.com/inematds/camada-contexto/releases/download/video-v1.0.0/camada-contexto-16x9.mp4
- Reel 9:16: https://github.com/inematds/camada-contexto/releases/download/video-v1.0.0/camada-contexto-reel.mp4
- Reproductores en la guía: https://inematds.github.io/camada-contexto/guia/es/#video

## Las tres capas

| capa | qué es | ejemplo |
|---|---|---|
| arriba | donde se ejecuta el trabajo | Claude, Codex, la próxima IA |
| en medio | el puente | Git, conector MCP, API |
| abajo | lo que es tuyo | repositorio privado con `contexto/` |

**Archivo × dato vivo:** los documentos que cambian poco (negocio, voz, público, decisiones, skills) quedan en el repositorio, en markdown. Los registros que cambian a cada rato (tareas, clientes) quedan en una base de datos, como Supabase.

## Cómo usar

```bash
git clone https://github.com/inematds/camada-contexto
cd camada-contexto
scripts/iniciar.sh ~/minha-empresa-contexto              # crea AGENTS.md, CLAUDE.md, contexto/ y entregas/
python3 scripts/checar_contexto.py ~/minha-empresa-contexto   # bloquea contraseñas, bases de datos y hojas de cálculo
tests/run.sh                                              # testa o kit
```

Después:
1. Crea un repositorio **privado** en GitHub y sube la carpeta (o usa [`prompts/copiar-contexto.md`](../traducoes/es/prompts/copiar-contexto.md)).
2. Conecta GitHub en Claude y ChatGPT/Codex y pega el mismo bloque: [`instrucoes/bloco-projeto.md`](../traducoes/es/instrucoes/bloco-projeto.md).
3. Haz la prueba de los dos agentes: [`prompts/teste-dois-agentes.md`](../traducoes/es/prompts/teste-dois-agentes.md).
4. Saca la memoria de las apps: [`prompts/memoria-para-arquivos.md`](../traducoes/es/prompts/memoria-para-arquivos.md).

## Licencia

MIT. De [INEMA.CLUB](https://inema.club).
