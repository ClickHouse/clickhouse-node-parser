CREATE TABLE table_2009_part
(
    i Int64,
    d Date,
    s String
)
ENGINE = MergeTree
ORDER BY i
PARTITION BY toYYYYMM(d);