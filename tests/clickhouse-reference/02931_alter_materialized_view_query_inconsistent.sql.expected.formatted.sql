CREATE TABLE src
(
    v UInt64
)
ENGINE = Null;

CREATE TABLE dest
(
    v UInt64
)
ENGINE = MergeTree()
ORDER BY v;

CREATE MATERIALIZED VIEW pipe
TO dest
AS
SELECT v
FROM src;