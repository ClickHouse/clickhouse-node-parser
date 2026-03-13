-- expected output is 2 because final is turned off
SELECT count()
FROM replacing_mt;

-- expected output is 4 because select_final == 0
SELECT count()
FROM
    lhs
INNER JOIN rhs
    ON lhs.x = rhs.x;

-- expected output is 2, it should silently ignore final modifier
SELECT count()
FROM regular_mt_table;

SELECT count()
FROM nv_regular_mt_table;

-- expected output
-- 1 c a c
-- 1 c b c
SELECT
    left_table.id,
    val_left,
    val_middle,
    val_right
FROM
    left_table
INNER JOIN middle_table
    ON left_table.id = middle_table.id
INNER JOIN right_table
    ON middle_table.id = right_table.id
ORDER BY
    left_table.id ASC,
    val_left ASC,
    val_middle ASC,
    val_right ASC;

-- extra: same with subquery
SELECT
    left_table.id,
    val_left,
    val_middle,
    val_right
FROM
    left_table
INNER JOIN middle_table
    ON left_table.id = middle_table.id
INNER JOIN (
        SELECT *
        FROM right_table
        WHERE id = 1
    ) AS r
    ON middle_table.id = r.id
ORDER BY
    left_table.id ASC,
    val_left ASC,
    val_middle ASC,
    val_right ASC;

-- expected output:
-- 1 c, 2 a, 2 b, 3 c
SELECT *
FROM merge_table
ORDER BY
    id ASC,
    val ASC;

SELECT sum(number)
FROM numbers(10)
SETTINGS final = 1;

SELECT sum(number)
FROM remote('127.0.0.{1,2}', numbers(10))
SETTINGS final = 1;