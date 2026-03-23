-- Tags: no-fasttest
SYSTEM DROP  TABLE IF EXISTS t_json_partitions;

SET enable_json_type = 1;

CREATE TABLE t_json_partitions
(
    id UInt32,
    obj JSON
)
ENGINE = MergeTree
ORDER BY id
PARTITION BY id;

INSERT INTO t_json_partitions;

SELECT *
FROM t_json_partitions
ORDER BY id ASC
FORMAT JSONEachRow;

SYSTEM DROP  TABLE t_json_partitions;