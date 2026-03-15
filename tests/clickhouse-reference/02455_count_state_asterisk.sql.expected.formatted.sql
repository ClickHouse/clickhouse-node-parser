CREATE TABLE a
(
    i int,
    j int
)
ENGINE = Log;

CREATE MATERIALIZED VIEW b
ENGINE = Log
AS
SELECT countState(*)
FROM a;

SELECT countMerge(*)
FROM b;