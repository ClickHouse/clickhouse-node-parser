CREATE TABLE t
(
    x UInt64
)
ENGINE = MergeTree
ORDER BY (x, intHash64(x))
SAMPLE BY intHash64(x);

CREATE TABLE t_buf AS t
ENGINE = Buffer(currentDatabase(), 't', 16, 20, 100, 100000, 10000000, 50000000, 250000000);

SELECT count()
FROM t_buf SAMPLE 1/2
FORMAT Null;