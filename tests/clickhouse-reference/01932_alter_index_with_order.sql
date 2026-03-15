CREATE TABLE alter_index_test (
    a UInt32,
    b Date,
    c UInt32,
    d UInt32,
    INDEX index_a a TYPE set(0) GRANULARITY 1
)
ENGINE = MergeTree()
ORDER BY tuple() SETTINGS add_minmax_index_for_numeric_columns=0;
SELECT * FROM system.data_skipping_indices WHERE table = 'alter_index_test' AND database = currentDatabase();
