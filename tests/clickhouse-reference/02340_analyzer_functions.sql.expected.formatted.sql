SET enable_analyzer = 1;

SELECT 1 + 1;

SELECT '--';

SELECT dummy + dummy;

CREATE TABLE test_table
(
    id UInt64,
    value String
)
ENGINE = TinyLog;

INSERT INTO test_table;

SELECT id + length(value)
FROM test_table;

SELECT concat(concat(toString(id), '_'), (value))
FROM test_table;