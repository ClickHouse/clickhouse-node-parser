SYSTEM DROP  TABLE IF EXISTS t;

CREATE TABLE t
(
    A Array(Int64)
)
ENGINE = MergeTree
ORDER BY tuple();

INSERT INTO t;

SELECT *
FROM t
PREWHERE arrayExists(x -> x = 5, A);

SYSTEM DROP  TABLE t;