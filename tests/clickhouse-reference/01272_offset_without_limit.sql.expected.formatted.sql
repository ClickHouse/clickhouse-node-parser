CREATE TABLE offset_without_limit
(
    value UInt32
)
ENGINE = MergeTree()
PRIMARY KEY value
ORDER BY value;

SELECT value
FROM offset_without_limit
ORDER BY value ASC
OFFSET 5;