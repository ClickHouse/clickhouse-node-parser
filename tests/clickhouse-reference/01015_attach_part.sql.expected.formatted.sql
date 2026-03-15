CREATE TABLE table_01
(
    date Date,
    n Int32
)
ENGINE = MergeTree()
ORDER BY date
PARTITION BY date;

SELECT COUNT()
FROM table_01;