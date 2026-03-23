SET enable_analyzer = 1;

CREATE TABLE test_table
(
    id UInt8,
    value Nullable(Decimal(38, 2))
)
ENGINE = MergeTree
ORDER BY id;

INSERT INTO test_table;

SELECT id IN (toDecimal64(257, NULL))
FROM test_table;