SET enable_json_type = 1;

CREATE TABLE t_json_partitions
(
    id UInt32,
    obj JSON
)
ENGINE = MergeTree
ORDER BY id
PARTITION BY id;

SELECT *
FROM t_json_partitions
ORDER BY id ASC
FORMAT JSONEachRow;