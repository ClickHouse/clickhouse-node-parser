CREATE TABLE offset_without_limit
(
    value UInt32
)
ENGINE = MergeTree()
ORDER BY value
PRIMARY KEY value;

SELECT value
FROM offset_without_limit
ORDER BY value ASC
OFFSET 5;