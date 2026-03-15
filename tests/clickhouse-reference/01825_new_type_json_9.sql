SET enable_json_type = 1;
CREATE TABLE t_json(id UInt64, obj JSON) ENGINE = MergeTree ORDER BY id;
SELECT distinct arrayJoin(JSONAllPathsWithTypes(obj)) as path from t_json order by path;
