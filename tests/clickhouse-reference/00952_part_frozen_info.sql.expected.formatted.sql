SYSTEM DROP  TABLE IF EXISTS part_info;

CREATE TABLE part_info
(
    t DateTime
)
ENGINE = MergeTree
ORDER BY (t)
PARTITION BY toDate(t);

INSERT INTO part_info;

SELECT
    name,
    is_frozen
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 'part_info';

INSERT INTO part_info;

SELECT *
FROM part_info
ORDER BY t ASC;

SYSTEM DROP  TABLE part_info;