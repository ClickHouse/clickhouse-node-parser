CREATE TABLE offset_without_limit
(
    value UInt32
)
ENGINE = MergeTree()
PRIMARY KEY value
ORDER BY value;

INSERT INTO offset_without_limit SELECT *
FROM `system`.numbers
LIMIT 50;

SELECT value
FROM offset_without_limit
ORDER BY value ASC
OFFSET 5;