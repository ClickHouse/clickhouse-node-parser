CREATE TABLE test
(
    str Nullable(String),
    i Int64
)
ENGINE = Memory();

SELECT '-----------String------------';

SELECT
    str,
    max(i)
FROM test
GROUP BY str
ORDER BY str ASC;