SELECT DISTINCT arrayJoin(JSONAllPathsWithTypes(arrayJoin(o.a.c.:`Array(JSON)`))) as path FROM t_json_10 order by path;
SELECT o FROM t_json_10 ORDER BY o.a.b FORMAT JSONEachRow;
SELECT o.a.b, o.a.c.:`Array(JSON)`.d, o.a.c.:`Array(JSON)`.e, o.a.c.:`Array(JSON)`.f FROM t_json_10 ORDER BY o.a.b;
