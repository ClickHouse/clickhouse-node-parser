CREATE TABLE test
(
    json JSON
)
ENGINE = Memory;

INSERT INTO test;

SELECT
    json,
    materialize('')
FROM test
ORDER BY `all` ASC;