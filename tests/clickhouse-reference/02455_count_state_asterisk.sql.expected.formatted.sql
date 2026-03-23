SYSTEM drop  table if exists a;

SYSTEM drop  table if exists b;

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

INSERT INTO a;

SELECT countMerge(*)
FROM b;

SYSTEM drop  table b;

SYSTEM drop  table a;