CREATE TABLE t_memory_compressed
(
    id UInt64,
    s String,
    arr Array(LowCardinality(String)),
    m Map(String, String)
)
ENGINE = Memory
SETTINGS compress = 1;

INSERT INTO t_memory_compressed;

INSERT INTO t_memory_compressed;

SELECT *
FROM t_memory_compressed
ORDER BY id ASC;