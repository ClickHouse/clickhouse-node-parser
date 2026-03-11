SELECT
    value,
    f
FROM bool_test
FORMAT JSONEachRow;

SELECT
    toUInt64(value),
    f
FROM bool_test;

SELECT
    value,
    f
FROM bool_test
WHERE value > 0;

SELECT
    value,
    f
FROM bool_test
ORDER BY value ASC
FORMAT TSV;