-- Tags: no-fasttest
DROP TABLE IF EXISTS test_02312;

CREATE TABLE test_02312
(
    x Tuple(a UInt32, b UInt32)
)
ENGINE = File(Parquet);

INSERT INTO test_02312;

SELECT *
FROM test_02312;

DROP TABLE test_02312;

CREATE TABLE test_02312
(
    x Tuple(a UInt32, b UInt32)
)
ENGINE = File(Arrow);

CREATE TABLE test_02312
(
    x Tuple(a UInt32, b UInt32)
)
ENGINE = File(ORC);

CREATE TABLE test_02312
(
    a Nested(b Nested(c UInt32))
)
ENGINE = File(Parquet);

INSERT INTO test_02312;

CREATE TABLE test_02312
(
    a Nested(b Nested(c UInt32))
)
ENGINE = File(Arrow);

CREATE TABLE test_02312
(
    a Nested(b Nested(c UInt32))
)
ENGINE = File(ORC);