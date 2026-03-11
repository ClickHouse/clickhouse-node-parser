SELECT '-- Assert total number of groups and records in distributed';

SELECT
    uniqExact(id),
    count()
FROM `03408_dist`;

SELECT
    id,
    val
FROM `03408_dist`
ORDER BY
    id ASC,
    val ASC
LIMIT 1 BY id
LIMIT 3
FORMAT JsonCompact
SETTINGS max_block_size = 1, exact_rows_before_limit = 0;

SELECT
    id,
    val
FROM `03408_dist`
ORDER BY
    id ASC,
    val ASC
LIMIT 1 BY id
LIMIT 3
FORMAT JsonCompact
SETTINGS max_block_size = 1, exact_rows_before_limit = 1;

SELECT
    id,
    val
FROM `03408_dist`
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
SETTINGS max_block_size = 1, exact_rows_before_limit = 1;

SELECT
    id,
    max(val)
FROM `03408_dist`
GROUP BY id
ORDER BY id ASC
LIMIT 1 BY id
LIMIT 4
FORMAT JSONCompact
SETTINGS max_block_size = 1, exact_rows_before_limit = 1, distributed_group_by_no_merge = 2;