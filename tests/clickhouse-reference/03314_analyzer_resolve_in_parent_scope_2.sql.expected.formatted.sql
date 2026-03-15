CREATE TABLE test
(
    raw_id String,
    columns_n Nested(col_1 Nullable(String), col_2 Nullable(String))
)
ENGINE = MergeTree
ORDER BY (raw_id);