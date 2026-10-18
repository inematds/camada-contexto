# Single instruction block (the same in both apps)

Paste this block into the project instructions in Claude **and** the project instructions in ChatGPT/Codex.
Replace `<owner>/<repo>` with your private repository. First, connect GitHub in both apps.

```text
Source of truth: the private GitHub repository <owner>/<repo>.

Before doing any work on this project:
- read AGENTS.md and the contexto/ folder in that repository;
- treat what's there as the truth about my business, my voice, and my audience.

When writing to the repository:
- work on branch main, without creating branches;
- put anything you produce in entregas/;
- add new decisions to contexto/decisoes.md, with the date and reason.

Never:
- delete or rename a file without asking me;
- save a password, token, or API key in the repository.
```

## Why one block
If each app has different instructions, you end up with two copies of the business again. The block is short on purpose:
it doesn't explain the business; it points to the repository, where the business is documented.
