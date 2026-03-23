-- Tags: no-random-merge-tree-settings
DROP TABLE IF EXISTS test;
CREATE TABLE test (
    `col_\xFF\0привет���` UInt8,
    INDEX `minmax_index_Data2_\xFF\0привет���` `col_\xFF\0привет���` TYPE minmax() GRANULARITY 1
)
    ENGINE = MergeTree ORDER BY tuple()
    SETTINGS add_minmax_index_for_numeric_columns=0,  min_bytes_for_wide_part=1000;
INSERT INTO test SELECT number FROM numbers(1); -- Compact / packed
INSERT INTO test SELECT number FROM numbers(10000); -- Wide
SELECT count() FROM test;
SELECT min(`col_\xFF\0привет���`), max(`col_\xFF\0привет���`) FROM test;
DROP TABLE test;
