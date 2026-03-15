CREATE TEMPORARY TABLE test
(
    data int,
    default Nullable(DateTime) DEFAULT '1977-01-01 00:00:00'
)
ENGINE = Memory();

SELECT *
FROM test;

CREATE TEMPORARY TABLE test
(
    data int,
    default DateTime DEFAULT '1977-01-01 00:00:00'
)
ENGINE = Memory();