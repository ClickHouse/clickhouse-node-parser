SET enable_json_type = 1;

CREATE TABLE t_json
(
    id UInt64,
    obj JSON
)
ENGINE = MergeTree
ORDER BY id
SETTINGS min_bytes_for_wide_part = 0;

SELECT DISTINCT arrayJoin(JSONAllPathsWithTypes(obj)) AS path
FROM t_json
ORDER BY path ASC;

SELECT count()
FROM t_json
WHERE isNotNull(obj.foo);