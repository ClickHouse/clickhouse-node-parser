CREATE TABLE no_prop_table
(
    some_column UInt64
)
ENGINE = MergeTree()
ORDER BY tuple();

CREATE TABLE r_no_prop_table
(
    some_column UInt64
)
ENGINE = ReplicatedMergeTree('/clickhouse/{database}/test/01493_r_no_prop_table', '1')
ORDER BY tuple();