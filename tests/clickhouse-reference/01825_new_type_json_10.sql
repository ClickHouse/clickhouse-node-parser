-- Tags: no-fasttest

SET enable_json_type = 1;
SET allow_suspicious_types_in_order_by = 1;
CREATE TABLE t_json_10 (o JSON) ENGINE = Memory;
SELECT DISTINCT arrayJoin(JSONAllPathsWithTypes(arrayJoin(o.a.c.:`Array(JSON)`))) as path FROM t_json_10 order by path;
SELECT o FROM t_json_10 ORDER BY o.a.b FORMAT JSONEachRow;
SELECT o.a.b, o.a.c.:`Array(JSON)`.d, o.a.c.:`Array(JSON)`.e, o.a.c.:`Array(JSON)`.f FROM t_json_10 ORDER BY o.a.b;
