SELECT DISTINCT arrayJoin(JSONAllPathsWithTypes(obj)) AS path FROM t_json ORDER BY path;
SELECT count() FROM t_json WHERE obj.foo IS NOT NULL;
