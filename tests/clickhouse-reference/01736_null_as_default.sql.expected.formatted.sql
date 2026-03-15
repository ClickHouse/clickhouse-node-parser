CREATE TABLE test_enum
(
    c Nullable(Enum16('A' = 1, 'B' = 2))
)
ENGINE = Log;

SELECT *
FROM test_enum;

SELECT toString(c)
FROM test_enum;

SELECT toString('aaaa', NULL);