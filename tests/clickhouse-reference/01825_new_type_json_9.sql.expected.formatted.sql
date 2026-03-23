-- Tags: no-fasttest
DROP TABLE IF EXISTS t_json;

SET enable_json_type = 1;

CREATE TABLE t_json
(
    id UInt64,
    obj JSON
)
ENGINE = MergeTree
ORDER BY id;

INSERT INTO t_json;

INSERT INTO t_json;

SELECT DISTINCT arrayJoin(JSONAllPathsWithTypes(obj)) AS path
FROM t_json
ORDER BY path ASC;