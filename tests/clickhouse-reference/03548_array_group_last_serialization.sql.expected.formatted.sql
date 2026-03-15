CREATE TABLE t0
(
    k0 String,
    v0 Nullable(String)
)
ENGINE = MergeTree()
ORDER BY (k0);

CREATE TABLE t1
(
    k0 String,
    v00 AggregateFunction(groupArrayLast(1), Nullable(String))
)
ENGINE = MergeTree
ORDER BY (k0);

CREATE MATERIALIZED VIEW mv0
TO t1
(
    k0 String,
    v0 AggregateFunction(groupArrayLast(1), Nullable(String))
)
AS
SELECT
    k0,
    groupArrayLastState(1)(v0) AS v00
FROM t0
GROUP BY k0;

SELECT v00
FROM t1
ORDER BY k0 ASC
FORMAT JSONEachRow;

CREATE TABLE t_memory
(
    k Int,
    v AggregateFunction(groupArrayLast(1), Nullable(String))
)
ENGINE = Memory;

SELECT v
FROM t_memory
ORDER BY k ASC
FORMAT JSONEachRow;