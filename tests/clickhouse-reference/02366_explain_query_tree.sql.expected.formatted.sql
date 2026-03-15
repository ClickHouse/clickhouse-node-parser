SET enable_analyzer = 1;

SELECT '--';

CREATE TABLE test_table
(
    id UInt64,
    value String
)
ENGINE = TinyLog;