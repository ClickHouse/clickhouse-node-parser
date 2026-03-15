-- Tags: no-fasttest

SET enable_json_type = 1;
CREATE TABLE t_json_2(id UInt64, data JSON)
ENGINE = MergeTree ORDER BY tuple();
SELECT id, data, JSONAllPathsWithTypes(data) FROM t_json_2 ORDER BY id;
