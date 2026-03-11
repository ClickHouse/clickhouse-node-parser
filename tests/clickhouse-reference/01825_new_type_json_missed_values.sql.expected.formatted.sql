SELECT DISTINCT arrayJoin(JSONAllPathsWithTypes(obj)) AS path
FROM t_json
ORDER BY path ASC;

SELECT count()
FROM t_json
WHERE isNotNull(obj.foo);