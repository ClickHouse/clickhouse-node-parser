SET enable_json_type = 1;

DROP TABLE IF EXISTS t_json_attach_partition;

CREATE TABLE t_json_attach_partition
(
    b UInt64,
    c JSON
)
ENGINE = MergeTree
ORDER BY tuple();

INSERT INTO t_json_attach_partition;

ALTER TABLE t_json_attach_partition DROP PARTITION tuple();

INSERT INTO t_json_attach_partition;

ALTER TABLE t_json_attach_partition ATTACH PARTITION tuple();

SELECT *
FROM t_json_attach_partition
ORDER BY toString(c) ASC
FORMAT JSONEachRow;

DROP TABLE t_json_attach_partition;