CREATE TABLE mutation_table
(
    date Date,
    key UInt64,
    value String
)
ENGINE = MergeTree()
PARTITION BY date
ORDER BY tuple();
SELECT distinct(value) FROM mutation_table ORDER BY value;
