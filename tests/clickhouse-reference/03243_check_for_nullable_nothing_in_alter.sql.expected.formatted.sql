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