SELECT DISTINCT arrayJoin(JSONAllPathsWithTypes(data)) AS path FROM type_json_dst ORDER BY path;
SELECT id, data FROM type_json_dst ORDER BY id;
SELECT * FROM type_json_dst ORDER BY data.k1 FORMAT JSONEachRow;
