---
--- Analyzer
---
INSERT INTO FUNCTION null() SELECT *
FROM input('x Int, y String')
SETTINGS
    async_insert = 1,
    allow_experimental_analyzer = 1;

INSERT INTO FUNCTION null('auto') SELECT *
FROM input('x Int, y String')
SETTINGS
    async_insert = 1,
    allow_experimental_analyzer = 1;

INSERT INTO FUNCTION null('x Int, y String') SELECT *
FROM input('x Int, y String')
SETTINGS
    async_insert = 1,
    allow_experimental_analyzer = 1;

---
--- Non-analyzer - does not support INSERT INTO FUNCTION null('auto') SELECT FROM input()
---
INSERT INTO FUNCTION null() SELECT *
FROM input('x Int, y String')
SETTINGS
    async_insert = 1,
    allow_experimental_analyzer = 0; -- { serverError QUERY_IS_PROHIBITED }

INSERT INTO FUNCTION null('x Int, y String') SELECT *
FROM input('x Int, y String')
SETTINGS
    async_insert = 1,
    allow_experimental_analyzer = 0;

SYSTEM drop  table if exists x;

CREATE TABLE x
(
    x Int,
    y String
)
ENGINE = Memory;

INSERT INTO x SELECT *
FROM input('x Int, y String')
SETTINGS async_insert = 1;

SELECT *
FROM x;