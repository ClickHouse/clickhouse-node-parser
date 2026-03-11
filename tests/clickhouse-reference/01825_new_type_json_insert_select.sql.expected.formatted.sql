SELECT DISTINCT arrayJoin(JSONAllPathsWithTypes(data)) AS path
FROM type_json_dst
ORDER BY path ASC;

SELECT
    id,
    data
FROM type_json_dst
ORDER BY id ASC;

SELECT *
FROM type_json_dst
ORDER BY data.k1 ASC
FORMAT JSONEachRow;