-- Tags: no-fasttest
SET enable_json_type = 1;

DROP TABLE IF EXISTS t_json_2;

CREATE TABLE t_json_2
(
    id UInt64,
    data JSON
)
ENGINE = MergeTree
ORDER BY tuple();

INSERT INTO t_json_2;

SELECT
    id,
    data,
    JSONAllPathsWithTypes(data)
FROM t_json_2
ORDER BY id ASC;

INSERT INTO t_json_2;