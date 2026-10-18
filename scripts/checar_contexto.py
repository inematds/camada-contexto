#!/usr/bin/env python3
"""checar_contexto.py — confere uma pasta de camada de contexto ANTES de enviar para o repositório.

Só leitura e local: não chama API nem envia nada.

Confere:
  - se os arquivos básicos existem (AGENTS.md, CLAUDE.md, contexto/negocio.md, voz.md, publico.md, regras.md)
  - se há algo parecido com senha, token ou chave de API (bloqueia)
  - se há banco de dados ou planilha dentro da pasta (dado vivo não mora aqui: bloqueia)
  - se há arquivo grande demais (> 1 MB: aviso) ou modelo sem preencher (<...>: aviso)

Uso: python3 scripts/checar_contexto.py <pasta>     (sai com 1 se houver bloqueio)
"""
import pathlib, re, sys

BASICOS = ["AGENTS.md", "CLAUDE.md", "contexto/negocio.md", "contexto/voz.md", "contexto/publico.md", "contexto/regras.md"]
DADO_VIVO = {".db", ".sqlite", ".sqlite3", ".duckdb", ".parquet", ".xlsx", ".xls", ".csv", ".mdb"}
SEGREDO = re.compile(
    r"(sk-[A-Za-z0-9_-]{16,}|ghp_[A-Za-z0-9]{20,}|github_pat_[A-Za-z0-9_]{20,}|AKIA[0-9A-Z]{16}|xox[bp]-[A-Za-z0-9-]{10,}"
    r"|-----BEGIN [A-Z ]*PRIVATE KEY-----|(?i:(api[_-]?key|secret|senha|password|token)\s*[:=]\s*['\"]?[A-Za-z0-9_\-/+]{8,}))")
PULAR = {".git", "node_modules", "__pycache__"}


def main():
    if len(sys.argv) != 2:
        print(__doc__); return 2
    raiz = pathlib.Path(sys.argv[1]).expanduser()
    if not raiz.is_dir():
        print(f"pasta não existe: {raiz}"); return 2
    bloqueios, avisos = [], []
    for b in BASICOS:
        if not (raiz / b).is_file():
            avisos.append(f"falta {b}")
    for p in sorted(raiz.rglob("*")):
        if not p.is_file() or PULAR & set(p.relative_to(raiz).parts):
            continue
        rel = p.relative_to(raiz)
        if p.suffix.lower() in DADO_VIVO:
            bloqueios.append(f"{rel}: banco de dados/planilha — dado vivo vai para um banco (ex.: Supabase), não para o repositório")
            continue
        if p.stat().st_size > 1_000_000:
            avisos.append(f"{rel}: {p.stat().st_size // 1024} KB — arquivo grande; contexto é texto curto")
        try:
            txt = p.read_text(encoding="utf-8")
        except (UnicodeDecodeError, OSError):
            continue
        for n, linha in enumerate(txt.splitlines(), 1):
            if SEGREDO.search(linha):
                bloqueios.append(f"{rel}:{n}: parece senha, token ou chave — tire do arquivo")
        if p.suffix == ".md" and re.search(r"<[a-zà-ú][^>]{2,60}>", txt) and "skills/README" not in str(rel):
            avisos.append(f"{rel}: ainda tem campos do modelo para preencher (<...>)")
    for b in bloqueios:
        print("BLOQUEIO", b)
    for a in avisos:
        print("aviso   ", a)
    print(f"{'REPROVADO' if bloqueios else 'OK'}: {len(bloqueios)} bloqueio(s), {len(avisos)} aviso(s)")
    return 1 if bloqueios else 0


if __name__ == "__main__":
    sys.exit(main())
