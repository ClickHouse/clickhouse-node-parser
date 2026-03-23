SYSTEM drop  table if exists src;

SYSTEM drop  table if exists dst;

SYSTEM drop  view if exists v;

CREATE TABLE src
(
    x Nullable(Int32)
)
ENGINE = Memory;

CREATE TABLE dst
(
    x Nullable(Int32)
)
ENGINE = Memory;

CREATE MATERIALIZED VIEW v
TO dst
AS
SELECT x
FROM src;

SYSTEM drop  view v;

SYSTEM drop  table dst;

SYSTEM drop  table src;