SYSTEM DROP  TABLE IF EXISTS mutation_table;

CREATE TABLE mutation_table
(
    date Date,
    key UInt64,
    value String
)
ENGINE = MergeTree()
ORDER BY tuple()
PARTITION BY date;

INSERT INTO mutation_table SELECT
    toDate('2019-10-01'),
    number,
    '42'
FROM numbers(100);

INSERT INTO mutation_table SELECT
    toDate('2019-10-02'),
    number,
    'Hello'
FROM numbers(100);

SELECT DISTINCT (value)
FROM mutation_table
ORDER BY value ASC;