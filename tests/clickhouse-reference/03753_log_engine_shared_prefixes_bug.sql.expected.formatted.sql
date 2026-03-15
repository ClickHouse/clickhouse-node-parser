CREATE TABLE test
(
    c String
)
ENGINE = Log;

SELECT *
FROM test
ORDER BY
    c ASC,
    c.size ASC
FORMAT Null;