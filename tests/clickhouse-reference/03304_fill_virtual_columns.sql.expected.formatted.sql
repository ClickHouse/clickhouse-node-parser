-- { echoOn }
CREATE TABLE test_virtual_columns
(
    a Int32
)
ENGINE = MergeTree()
ORDER BY a;

INSERT INTO test_virtual_columns;

SELECT _part_offset
FROM test_virtual_columns;