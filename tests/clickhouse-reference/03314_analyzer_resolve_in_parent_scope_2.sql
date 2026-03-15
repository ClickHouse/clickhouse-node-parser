create table test
(
    raw_id String,
    columns_n Nested
        (
        col_1 Nullable(String),
        col_2 Nullable(String)
        )
)
Engine = MergeTree
order by (raw_id);
