CREATE TABLE test_table
(
    a Array(Int8),
    d Decimal32(4),
    c Tuple(DateTime64(3), UUID)
)
ENGINE = GenerateRandom();

SELECT COUNT(*)
FROM (
        SELECT *
        FROM test_table
        LIMIT 100
    );

CREATE TABLE test_table_2
(
    a Array(Int8),
    d Decimal32(4),
    c Tuple(DateTime64(3, 'UTC'), UUID)
)
ENGINE = GenerateRandom(10, 5, 3);

SELECT *
FROM test_table_2
LIMIT 100;