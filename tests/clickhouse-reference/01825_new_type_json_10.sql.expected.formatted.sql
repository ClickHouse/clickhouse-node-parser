SELECT DISTINCT arrayJoin(JSONAllPathsWithTypes(arrayJoin(o.a.c.:`Array(JSON)`))) AS path
FROM t_json_10
ORDER BY path ASC;

SELECT o
FROM t_json_10
ORDER BY o.a.b ASC
FORMAT JSONEachRow;

SELECT
    o.a.b,
    o.a.c.:`Array(JSON)`.d,
    o.a.c.:`Array(JSON)`.e,
    o.a.c.:`Array(JSON)`.f
FROM t_json_10
ORDER BY o.a.b ASC;