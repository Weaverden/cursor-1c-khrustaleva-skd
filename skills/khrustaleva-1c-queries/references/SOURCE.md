# Источник: Хрусталева, СКД

**Книга:** Хрусталева Е.Ю. «Разработка сложных отчётов в „1С:Предприятии 8“. Система компоновки данных», изд. 2 (1С-Паблишинг).

**Публичная ссылка (PDF):** https://disk.yandex.ru/i/mv-JEzR4inD25A

## Что входит в репозиторий cursor-1c-skills

В Git — только **структурированные выжимки** (`00-toc.md` … `07-checklist.md`). Этого достаточно агенту Cursor для работы.

## Опционально: PDF и полный текст (на каждом ПК)

Файлы **не** в Git (объём ~27 МБ PDF + ~1 МБ текста). Скачать на Mac или Windows:

```powershell
# Windows (из корня cursor-1c-skills)
.\skills\khrustaleva-1c-queries\scripts\download-book.ps1
```

```bash
# macOS / Linux
./skills/khrustaleva-1c-queries/scripts/download-book.sh
```

Куда сохраняется:

| ОС | Каталог |
|----|---------|
| Windows | `%USERPROFILE%\.cursor\knowledge\khrustaleva-reports\` |
| macOS/Linux | `~/.cursor/knowledge/khrustaleva-reports/` |

После скачивания: `khrustaleva-slozhnye-otchety-1c8.pdf`, при необходимости `references/full-text-with-pages.txt` (если установлен Python + pymupdf).

## Синхронизация Mac ↔ Windows

1. Храните репозиторий в Git (основной хостинг — **GitVerse**; см. README пакета).
2. На **каждой** машине после `git pull`:

```powershell
cd C:\path\to\cursor-1c-skills
.\install.ps1 -Global
```

```bash
cd ~/cursor-1c-skills
# macOS: скопировать install вручную или:
powershell.exe -NoProfile -File install.ps1 -Global  # если есть PowerShell
# либо:
mkdir -p ~/.cursor/skills ~/.cursor/rules
cp -r skills/khrustaleva-1c-queries ~/.cursor/skills/
cp rules/khrustaleva-1c-queries.mdc ~/.cursor/rules/
```

3. Опционально на обеих машинах: `download-book.ps1` / `download-book.sh`.

Выжимки в `~/.cursor/skills/khrustaleva-1c-queries/references/` обновляются при каждом `install.ps1 -Global`.
