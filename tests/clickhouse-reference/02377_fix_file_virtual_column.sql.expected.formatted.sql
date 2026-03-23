SYSTEM drop  table if exists test_02377;

CREATE TABLE test_02377
(
    n UInt32,
    s String
)
ENGINE = File(CSVWithNames);

INSERT INTO test_02377;

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

SYSTEM drop  table test_02377;