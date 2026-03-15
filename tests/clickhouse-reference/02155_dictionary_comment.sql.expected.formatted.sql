CREATE TABLE `02155_test_table`
(
    id UInt64,
    value String
)
ENGINE = TinyLog;

CREATE DICTIONARY `02155_test_dictionary`
(
    id UInt64,
    value String
)
PRIMARY KEY id
SOURCE(clickhouse(TABLE '02155_test_table'))
LAYOUT(DIRECT());

SELECT
    name,
    comment
FROM `system`.dictionaries
WHERE name == '02155_test_dictionary'
    AND database == currentDatabase();

SELECT
    name,
    comment
FROM `system`.tables
WHERE name == '02155_test_dictionary'
    AND database == currentDatabase();

SELECT *
FROM `02155_test_dictionary`;

CREATE TABLE `02155_test_dictionary_view`
(
    id UInt64,
    value String
)
ENGINE = Dictionary(concat(currentDatabase(), '.02155_test_dictionary'));

SELECT *
FROM `02155_test_dictionary_view`;

SELECT
    name,
    comment
FROM `system`.tables
WHERE name == '02155_test_dictionary_view'
    AND database == currentDatabase();