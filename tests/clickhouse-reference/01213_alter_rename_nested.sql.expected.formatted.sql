CREATE TABLE table_for_rename_nested
(
    date Date,
    key UInt64,
    n Nested(x UInt32, y String),
    value1 Array(Array(LowCardinality(String)))
)
ENGINE = MergeTree()
ORDER BY key
PARTITION BY date;

INSERT INTO table_for_rename_nested (date, key, n.x, n.y, value1) SELECT
    toDate('2019-10-01'),
    number,
    [number + 1, number + 2, number + 3],
    ['a', 'b', 'c'],
    [[toString(number)]]
FROM numbers(10);

SELECT n.x
FROM table_for_rename_nested
WHERE key = 7;

SELECT n.y
FROM table_for_rename_nested
WHERE key = 7;

SELECT
    key,
    n.renamed_x
FROM table_for_rename_nested
WHERE key = 7;

SELECT
    key,
    n.renamed_y
FROM table_for_rename_nested
WHERE key = 7;

SELECT renamed_value1
FROM table_for_rename_nested
WHERE key = 7;

SELECT *
FROM table_for_rename_nested
WHERE key = 7
FORMAT TSVWithNames;