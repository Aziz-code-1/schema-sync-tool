# Schema Sync Tool (PostgreSQL)

Инструмент для сравнения двух таблиц в разных схемах PostgreSQL и выявления различий в структуре.

---

## Что делает

Скрипт сравнивает:

- Названия колонок
- Типы данных
- Размерности (length / precision / scale)
- Nullable / NOT NULL

---

## Входные таблицы

- stage.hm_d300_00_r06
- base.hm_d300_00_r29

---

## Как использовать

1. Открой PostgreSQL / DBeaver
2. Запусти файл:

```sql
compare_schemas.sql
