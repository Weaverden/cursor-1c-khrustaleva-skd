# cursor-1c-khrustaleva-queries

База знаний для **Cursor IDE** по книге Хрусталевой: **язык запросов 1С в целом** (соединения, виртуальные таблицы, параметры, остатки) **и** отчёты на **СКД**.

Структурированные выжимки + скил и правило для агента. Работает на **Windows и macOS**.

## Источник

**Хрусталева Е.Ю.** «Разработка сложных отчётов в „1С:Предприятии 8“. Система компоновки данных», изд. 2 (1С-Паблишинг).

## Установка

### Windows

```powershell
git clone https://github.com/Weaverden/cursor-1c-khrustaleva-queries.git
cd cursor-1c-khrustaleva-queries
.\install.ps1 -Global
```

### macOS / Linux

```bash
git clone https://github.com/Weaverden/cursor-1c-khrustaleva-queries.git
cd cursor-1c-khrustaleva-queries
./install.sh
```

Устанавливает в `~/.cursor/skills/khrustaleva-1c-queries/` и `~/.cursor/rules/khrustaleva-1c-queries.mdc`.

## Содержание справочника

| Файл | Тема |
|------|------|
| `00-toc.md` | Оглавление книги, навигация |
| `01-architecture-skd.md` | Наборы данных, связь vs объединение |
| `02-query-single-dataset.md` | JOIN в одном запросе |
| `03-dataset-links.md` | Связи наборов, `В (&Ссылка)` |
| `04-union-vs-link-vs-query.md` | Архитектура отчёта |
| `05-parameters-periods.md` | Период и параметры |
| `06-balance-totals.md` | Итоги по остаткам |
| `07-checklist.md` | Чеклист перед сдачей |
| `08-query-language-general.md` | **Язык запросов в модулях и консоли** (не только СКД) |

## Связь с cursor-1c-skills

Этот репозиторий — **отдельный** пакет по Хрусталевой (запросы + СКД). Полный набор скилов 1С: [cursor-1c-skills](https://github.com/Desko77/cursor-1c-skills) (скил `khrustaleva-1c-queries` дублируется в коллекции).

> Раньше: `cursor-1c-khrustaleva-skd` / `khrustaleva-skd-queries` — GitHub перенаправляет на новые имена.

## Лицензия репозитория

Код установки и markdown-выжимки — MIT (см. LICENSE). Книга Хрусталевой — материалы правообладателя; в репозитории **нет** PDF и полного текста.
