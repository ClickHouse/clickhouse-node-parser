SET enable_analyzer = 1;

SELECT '--';

DROP TABLE IF EXISTS test_table;

CREATE TABLE test_table
(
    id UInt64,
    value String
)
ENGINE = TinyLog;

INSERT INTO test_table;

DROP TABLE test_table;