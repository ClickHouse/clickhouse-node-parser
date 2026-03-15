CREATE TABLE part_info
(
    t DateTime
)
ENGINE = MergeTree
ORDER BY t
PARTITION BY toDate(t);

SELECT
    name,
    is_frozen
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 'part_info';

SELECT *
FROM part_info
ORDER BY t ASC;