SYSTEM DROP  TABLE IF EXISTS table_01;

CREATE TABLE table_01
(
    date Date,
    n Int32
)
ENGINE = MergeTree()
ORDER BY date
PARTITION BY date;

INSERT INTO table_01 SELECT
    toDate('2019-10-01'),
    number
FROM `system`.numbers
LIMIT 1000;

SELECT COUNT()
FROM table_01;