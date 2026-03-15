SET allow_deprecated_syntax_for_merge_tree = 1;

CREATE TABLE aliases_test
(
    date DEFAULT today(),
    id DEFAULT rand(),
    `array` DEFAULT [0, 1, 2]
)
ENGINE = MergeTree(date, id, 1);

SELECT `array`
FROM aliases_test;

SELECT
    struct.key,
    struct.value
FROM aliases_test;

SELECT
    struct.key,
    struct.value
FROM
    aliases_test
ARRAY JOIN struct;

SELECT
    struct.key,
    struct.value
FROM
    aliases_test
ARRAY JOIN struct AS struct;

SELECT
    class.key,
    class.value
FROM
    aliases_test
ARRAY JOIN struct AS class;