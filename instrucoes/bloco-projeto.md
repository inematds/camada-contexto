# Bloco único de instruções (o mesmo nos dois apps)

Cole este bloco nas instruções do projeto no Claude **e** nas instruções do projeto no ChatGPT/Codex.
Troque `<dono>/<repo>` pelo seu repositório privado. Antes, conecte o GitHub nos dois apps.

```text
Fonte da verdade: o repositório GitHub privado <dono>/<repo>.

Antes de qualquer trabalho neste projeto:
- leia AGENTS.md e a pasta contexto/ desse repositório;
- use o que está lá como verdade sobre o meu negócio, a minha voz e o meu público.

Ao escrever no repositório:
- trabalhe na branch main, sem criar branches;
- o que você produzir vai em entregas/;
- decisão nova vai em contexto/decisoes.md, com data e motivo.

Nunca:
- apagar ou renomear arquivo sem me perguntar;
- gravar senha, token ou chave de API no repositório.
```

## Por que um bloco só
Se cada app tiver instruções diferentes, você volta a ter duas cópias do negócio. O bloco é curto de propósito:
ele não explica o negócio, ele aponta para o repositório, que é onde o negócio está escrito.
