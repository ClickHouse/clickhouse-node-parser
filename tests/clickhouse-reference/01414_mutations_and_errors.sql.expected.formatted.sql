CREATE TABLE mutation_table
(
    date Date,
    key UInt64,
    value String
)
ENGINE = MergeTree()
ORDER BY tuple()
PARTITION BY date;

SELECT DISTINCT (value)
FROM mutation_table
ORDER BY value ASC;