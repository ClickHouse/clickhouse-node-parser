SELECT arrayJoin(distinctJSONPathsAndTypes(json))
FROM test;

SELECT arrayJoin(distinctJSONPathsAndTypes(arrayJoin(json.`k1[]`)))
FROM test;

SELECT arrayJoin(distinctJSONPathsAndTypes(arrayJoin(json.`k2[]`)))
FROM test;

SELECT arrayJoin(distinctJSONPathsAndTypes(arrayJoin(json.`k9[]`)))
FROM test;

SELECT
    json.`k1[]`,
    json.`k1[]`.`k1_1[]`,
    json.`k1[]`.`k1_1[]`.k1_1_1,
    json.`k1[]`.`k1_2[]`,
    json.`k1[]`.`k1_2[]`.k1_2_1,
    json.`k2[]`,
    json.`k2[]`.`k2_1[]`,
    json.`k2[]`.`k2_1[]`.k2_1_1,
    json.`k2[]`.`k2_2[]`,
    json.`k2[]`.`k2_2[]`.k2_2_1,
    json.`k9[]`,
    json.`k9[]`.`k9_1[]`,
    json.`k9[]`.`k9_1[]`.k9_1_1,
    json.`k9[]`.`k9_2[]`,
    json.`k9[]`.`k9_2[]`.k9_2_1
FROM test
FORMAT JSONColumns;

SELECT arrayJoin(distinctJSONPathsAndTypes(json))
FROM test2;

SELECT arrayJoin(distinctJSONPathsAndTypes(arrayJoin(json.`k1[]`)))
FROM test2;

SELECT arrayJoin(distinctJSONPathsAndTypes(arrayJoin(json.`k2[]`)))
FROM test2;

SELECT arrayJoin(distinctJSONPathsAndTypes(arrayJoin(json.`k9[]`)))
FROM test2;

SELECT arrayJoin(distinctJSONPathsAndTypes(json))
FROM test3;

SELECT arrayJoin(distinctJSONPathsAndTypes(arrayJoin(json.`k1[]`)))
FROM test3;

SELECT arrayJoin(distinctJSONPathsAndTypes(arrayJoin(json.`k2[]`)))
FROM test3;

SELECT arrayJoin(distinctJSONPathsAndTypes(arrayJoin(json.`k9[]`)))
FROM test3;

SELECT arrayJoin(distinctJSONPathsAndTypes(json))
FROM test4;

SELECT arrayJoin(distinctJSONPathsAndTypes(arrayJoin(json.`k1[]`)))
FROM test4;

SELECT arrayJoin(distinctJSONPathsAndTypes(arrayJoin(json.`k2[]`)))
FROM test4;

SELECT arrayJoin(distinctJSONPathsAndTypes(arrayJoin(json.`k9[]`)))
FROM test4;