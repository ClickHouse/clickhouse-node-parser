CREATE TABLE test_02377
(
    n UInt32,
    s String
)
ENGINE = File(CSVWithNames);

SELECT *
FROM test_02377
ORDER BY n ASC;

SELECT
    *,
    _path,
    _file
FROM test_02377
FORMAT Null;

SELECT
    _path,
    _file
FROM test_02377
FORMAT Null;