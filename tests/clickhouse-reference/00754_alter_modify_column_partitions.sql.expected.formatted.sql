-- check ALTER MODIFY COLUMN with partitions
SET send_logs_level = 'fatal';

CREATE TABLE alter_column
(
    x UInt32,
    y Int32
)
ENGINE = MergeTree
ORDER BY x
PARTITION BY x;

INSERT INTO alter_column (x, y) SELECT
    number AS x,
    negate(number) AS y
FROM `system`.numbers
LIMIT 50;

SELECT *
FROM alter_column
ORDER BY _part ASC;