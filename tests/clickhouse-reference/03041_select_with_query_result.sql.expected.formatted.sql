-- https://github.com/ClickHouse/ClickHouse/issues/44153
SET enable_analyzer = 1;

CREATE TABLE parent
(
    a_id Int64,
    b_id Int64,
    c_id Int64,
    created_at Int64
)
ENGINE = MergeTree()
ORDER BY (a_id, b_id, c_id, created_at);

CREATE TABLE join_table_1
(
    a_id Int64,
    b_id Int64
)
ENGINE = MergeTree()
ORDER BY (a_id, b_id);

CREATE TABLE join_table_2
(
    c_id Int64,
    created_at Int64
)
ENGINE = MergeTree()
ORDER BY (c_id, created_at);