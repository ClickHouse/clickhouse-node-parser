CREATE TABLE table_01 (
    date Date,
    n Int32
) ENGINE = MergeTree()
PARTITION BY date
ORDER BY date;
INSERT INTO table_01 SELECT toDate('2019-10-01'), number FROM system.numbers LIMIT 1000;
SELECT COUNT() FROM table_01;
