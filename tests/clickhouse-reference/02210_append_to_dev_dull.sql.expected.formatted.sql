-- Tags: no-fasttest
INSERT INTO FUNCTION file('/dev/null', 'Parquet', 'number UInt64') SELECT *
FROM numbers(10);

INSERT INTO FUNCTION file('/dev/null', 'ORC', 'number UInt64') SELECT *
FROM numbers(10);

INSERT INTO FUNCTION file('/dev/null', 'JSON', 'number UInt64') SELECT *
FROM numbers(10);