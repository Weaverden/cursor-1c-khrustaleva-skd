# cursor-1c-khrustaleva-skd

База знаний для **Cursor IDE**: сложные отчёты и запросы в **системе компоновки данных (СКД)** по книге Хрусталевой.

Структурированные выжимки (не полный текст книги) + скил и правило для агента Cursor. Работает на **Windows и macOS**.

## Источник

**Хрусталева Е.Ю.** «Разработка сложных отчётов в „1С:Предприятии 8“. Система компоновки данных», изд. 2.

PDF (опционально): https://disk.yandex.ru/i/mv-JEzR4inD25A

## Установка

### Windows

```powershell
git clone https://github.com/<ваш-логин>/cursor-1c-khrustaleva-skd.git
cd cursor-1c-khrustaleva-skd
.\install.ps1 -Global
```

### macOS / Linux

```bash
git clone https://github.com/<ваш-логин>/cursor-1c-khrustaleva-skd.git
cd cursor-1c-khrustaleva-skd
./install.sh
```

Устанавливает в `~/.cursor/skills/khrustaleva-skd-queries/` и `~/.cursor/rules/khrustaleva-skd-queries.mdc`.

### PDF на диск (опционально)

```powershell
.\skills\khrustaleva-skd-queries\scripts\download-book.ps1
```

```bash
./skills/khrustaleva-skd-queries/scripts/download-book.sh
```

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

## Связь с cursor-1c-skills

Этот репозиторий — **отдельный** пакет только по Хрусталевой/СКД. Полный набор скилов 1С: [cursor-1c-skills](https://github.com/Desko77/cursor-1c-skills) (там же есть скил `khrustaleva-skd-queries` как часть коллекции).

## Лицензия репозитория

Код установки и markdown-выжимки — MIT (см. LICENSE). Книга Хрусталевой — материалы правообладателя; в репозитории **нет** PDF и полного текста.
