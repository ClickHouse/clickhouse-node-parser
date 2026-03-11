SELECT '-- Assert total number of groups and records in memory';

SELECT
    uniqExact(id),
    count()
FROM `03408_memory`;

SELECT
    id,
    val
FROM `03408_memory`
ORDER BY
    id ASC,
    val ASC
LIMIT 1 BY id
LIMIT 3
FORMAT JsonCompact
SETTINGS exact_rows_before_limit = 1;

SELECT
    id,
    val
FROM `03408_memory`
GROUP BY
    id,
    val
HAVING id < 7
ORDER BY
    id ASC,
    val DESC
LIMIT 1 BY id
LIMIT 3
FORMAT JsonCompact
SETTINGS exact_rows_before_limit = 1;