CREATE TABLE test
(
    json JSON
)
ENGINE = Memory;

SELECT
    json,
    materialize('')
FROM test
ORDER BY `all` ASC;