SYSTEM DROP  TABLE IF EXISTS a;

SYSTEM DROP  TABLE IF EXISTS b;

CREATE TABLE a
(
    key Nullable(String)
)
ENGINE = MergeTree
ORDER BY tuple();

INSERT INTO a;

CREATE TABLE b
(
    key Nullable(String)
)
ENGINE = MergeTree
ORDER BY tuple();

INSERT INTO b;

SELECT a.key
FROM
    a
LEFT JOIN b
    ON tuple(a.key) = tuple(b.key)
ORDER BY a.key ASC;

SELECT a.key
FROM
    a
LEFT JOIN b
    ON a.key <=> b.key
ORDER BY a.key ASC;

SELECT a.key
FROM
    a
LEFT JOIN b
    ON tuple(a.key) = tuple(b.key)
ORDER BY a.key ASC;