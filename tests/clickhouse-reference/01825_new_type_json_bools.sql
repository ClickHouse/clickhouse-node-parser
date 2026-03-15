SET enable_json_type = 1;
CREATE TABLE t_json_bools (data JSON) ENGINE = Memory;
SELECT data, JSONAllPathsWithTypes(data) FROM t_json_bools;
