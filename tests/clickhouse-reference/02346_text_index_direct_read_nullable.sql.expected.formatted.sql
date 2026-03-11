SELECT *
FROM tab
WHERE hasAnyTokens(val, toNullable('hello'));

SELECT *
FROM tab
PREWHERE hasAnyTokens(val, toNullable('hello'));

SELECT *
FROM tab
WHERE NOT hasAnyTokens(val, toNullable('FOO'));

SELECT *
FROM tab
PREWHERE NOT hasAnyTokens(val, toNullable('FOO'));

SELECT count()
FROM tab
PREWHERE and(key > 0, NOT hasAnyTokens(val, toNullable('FOO')));