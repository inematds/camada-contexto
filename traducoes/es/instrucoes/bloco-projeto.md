# Bloque único de instrucciones (el mismo en ambas apps)

Pega este bloque en las instrucciones del proyecto en Claude **y** en las instrucciones del proyecto en ChatGPT/Codex.
Reemplaza `<dueño>/<repo>` por tu repositorio privado. Antes, conecta GitHub en ambas apps.

```text
Fuente de la verdad: el repositorio privado de GitHub <dueño>/<repo>.

Antes de cualquier trabajo en este proyecto:
- lee AGENTS.md y la carpeta contexto/ de ese repositorio;
- usa lo que está allí como verdad sobre mi negocio, mi voz y mi público.

Al escribir en el repositorio:
- trabaja en la branch main, sin crear branches;
- lo que produzcas va en entregas/;
- una decisión nueva va en contexto/decisoes.md, con fecha y motivo.

Nunca:
- borres ni cambies el nombre de un archivo sin preguntarme;
- guardes una contraseña, un token o una clave de API en el repositorio.
```

## Por qué un solo bloque
Si cada app tiene instrucciones diferentes, vuelves a tener dos copias del negocio. El bloque es breve a propósito:
no explica el negocio, apunta al repositorio, que es donde está escrito.
