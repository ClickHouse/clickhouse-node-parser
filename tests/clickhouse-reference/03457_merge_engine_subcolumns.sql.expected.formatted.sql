SELECT *
FROM test_merge
ORDER BY `all` ASC;

SELECT t.a
FROM test_merge
ORDER BY `all` ASC;

SELECT t.b
FROM test_merge
ORDER BY `all` ASC;

SELECT
    x,
    t.a
FROM test_merge
ORDER BY `all` ASC;

SELECT
    y,
    t.a
FROM test_merge
ORDER BY `all` ASC;

SELECT
    t.a,
    t.b
FROM test_merge
ORDER BY `all` ASC;

SELECT
    x,
    t.a,
    t.b
FROM test_merge
ORDER BY `all` ASC;

SELECT
    y,
    t.a,
    t.b
FROM test_merge
ORDER BY `all` ASC;

SELECT
    x,
    t.a,
    t.b,
    y
FROM test_merge
ORDER BY `all` ASC;

SELECT
    json.a.b,
    json.a.g,
    json.c,
    json.d
FROM test_merge;