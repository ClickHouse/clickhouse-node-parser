SET enable_json_type = 1;

SET output_format_native_write_json_as_string = 0;

CREATE TABLE test
(
    json JSON(max_dynamic_paths = 8, max_dynamic_types = 4)
)
ENGINE = Memory;

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

CREATE TABLE test2
(
    json JSON(max_dynamic_paths = 16, max_dynamic_types = 8)
)
ENGINE = Memory;

SELECT arrayJoin(distinctJSONPathsAndTypes(json))
FROM test2;

SELECT arrayJoin(distinctJSONPathsAndTypes(arrayJoin(json.`k1[]`)))
FROM test2;

SELECT arrayJoin(distinctJSONPathsAndTypes(arrayJoin(json.`k2[]`)))
FROM test2;

SELECT arrayJoin(distinctJSONPathsAndTypes(arrayJoin(json.`k9[]`)))
FROM test2;

CREATE TABLE test3
(
    json JSON(max_dynamic_paths = 4, max_dynamic_types = 2)
)
ENGINE = Memory;

SELECT arrayJoin(distinctJSONPathsAndTypes(json))
FROM test3;

SELECT arrayJoin(distinctJSONPathsAndTypes(arrayJoin(json.`k1[]`)))
FROM test3;

SELECT arrayJoin(distinctJSONPathsAndTypes(arrayJoin(json.`k2[]`)))
FROM test3;

SELECT arrayJoin(distinctJSONPathsAndTypes(arrayJoin(json.`k9[]`)))
FROM test3;

CREATE TABLE test4
(
    json JSON(max_dynamic_paths = 8, max_dynamic_types = 4)
)
ENGINE = Memory;

SELECT arrayJoin(distinctJSONPathsAndTypes(json))
FROM test4;

SELECT arrayJoin(distinctJSONPathsAndTypes(arrayJoin(json.`k1[]`)))
FROM test4;

SELECT arrayJoin(distinctJSONPathsAndTypes(arrayJoin(json.`k2[]`)))
FROM test4;

SELECT arrayJoin(distinctJSONPathsAndTypes(arrayJoin(json.`k9[]`)))
FROM test4;