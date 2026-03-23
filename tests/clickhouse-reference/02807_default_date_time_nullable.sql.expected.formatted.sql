CREATE TEMPORARY TABLE test
(
    data int,
    default Nullable(DateTime) DEFAULT '1977-01-01 00:00:00'
)
ENGINE = Memory();

INSERT INTO test (data) SELECT 1;

SELECT *
FROM test;

DROP TEMPORARY TABLE test;

CREATE TEMPORARY TABLE test
(
    data int,
    default DateTime DEFAULT '1977-01-01 00:00:00'
)
ENGINE = Memory();