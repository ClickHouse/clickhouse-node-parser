SET enable_json_type = 1;

CREATE TABLE t_json_attach_partition
(
    b UInt64,
    c JSON
)
ENGINE = MergeTree
ORDER BY tuple();

SELECT *
FROM t_json_attach_partition
ORDER BY toString(c) ASC
FORMAT JSONEachRow;