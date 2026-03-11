SELECT DISTINCT arrayJoin(JSONAllPathsWithTypes(obj)) AS path
FROM t_json
ORDER BY path ASC;