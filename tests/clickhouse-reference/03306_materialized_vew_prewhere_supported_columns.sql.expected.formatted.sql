SYSTEM DROP  TABLE IF EXISTS dst;

SYSTEM DROP  TABLE IF EXISTS src;

SYSTEM DROP  VIEW IF EXISTS v;

CREATE TABLE dst
(
    c0 Int,
    c1 Int
)
ENGINE = MergeTree()
ORDER BY tuple();

CREATE TABLE src
(
    c0 Nullable(Int),
    c1 Int
)
ENGINE = MergeTree()
ORDER BY tuple();

CREATE MATERIALIZED VIEW v
TO dst
(
    c0 Nullable(Int),
    c1 Int
)
AS
(SELECT
    c0,
    c1
FROM src);

INSERT INTO src (c0, c1);

SELECT *
FROM v
PREWHERE c0 = 1; -- {serverError ILLEGAL_PREWHERE}

SELECT *
FROM v
PREWHERE c1 = 1;

SELECT *
FROM v
PREWHERE c0 = c1; -- {serverError ILLEGAL_PREWHERE}

SYSTEM DROP  VIEW v;

SYSTEM DROP  TABLE src;

SYSTEM DROP  TABLE dst;