CREATE TABLE table_01 (
    date Date,
    n Int32
) ENGINE = MergeTree()
PARTITION BY date
ORDER BY date;
SELECT COUNT() FROM table_01;
