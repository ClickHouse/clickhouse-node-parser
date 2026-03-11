SELECT
    type,
    new_part_name
FROM `system`.replication_queue
WHERE database = currentDatabase()
    AND table = 'rmt2'
ORDER BY new_part_name ASC;

SELECT
    1,
    n,
    _part
FROM rmt1
ORDER BY n ASC;

SELECT
    2,
    n,
    _part
FROM rmt2
ORDER BY n ASC;

SELECT
    3,
    n,
    _part
FROM rmt1
ORDER BY n ASC;

SELECT
    4,
    n
FROM rmt2
ORDER BY n ASC;

SELECT
    5,
    n,
    _part
FROM rmt1
ORDER BY n ASC;

SELECT
    6,
    n,
    _part
FROM rmt2
ORDER BY n ASC;