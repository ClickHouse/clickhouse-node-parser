-- Tags: no-fasttest
SET enable_json_type = 1;

SET input_format_json_infer_array_of_dynamic_from_array_of_different_types = 0;

CREATE TABLE t_json_2
(
    id UInt64,
    data JSON
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test_01825_2/t_json_2', 'r1')
ORDER BY tuple();

SELECT
    id,
    data,
    JSONAllPathsWithTypes(data)
FROM t_json_2
ORDER BY id ASC;

SELECT
    id,
    data.k1,
    data.k2,
    data.k3
FROM t_json_2
ORDER BY id ASC;

SELECT
    id,
    data.k1
FROM t_json_2
ORDER BY id ASC;

SELECT
    id,
    data.k1.k2,
    data.k1.k3,
    data.k1.k4
FROM t_json_2
ORDER BY id ASC;