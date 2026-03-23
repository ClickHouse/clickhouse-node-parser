SET enable_json_type = 1;

CREATE TABLE t_json_attach_partition
(
    b UInt64,
    c JSON
)
ENGINE = MergeTree
ORDER BY tuple();

INSERT INTO t_json_attach_partition;

INSERT INTO t_json_attach_partition;

SELECT *
FROM t_json_attach_partition
ORDER BY toString(c) ASC
FORMAT JSONEachRow;