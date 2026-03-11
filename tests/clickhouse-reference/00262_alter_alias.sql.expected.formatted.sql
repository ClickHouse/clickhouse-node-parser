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