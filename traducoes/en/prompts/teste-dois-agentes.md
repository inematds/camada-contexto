# Prompt: the two-agent test

1. In **Codex/ChatGPT**:
```text
In the repository <owner>/<repo>, create entregas/teste-ponte.md with today's date and the phrase "created by Codex".
```
2. In **Claude**:
```text
In the repository <owner>/<repo>, open entregas/teste-ponte.md and add the line "edited by Claude".
Then show me the entire file.
```
If the final file has both lines, the bridge works in both directions. Delete the test file afterward (by asking).
