CREATE TABLE limit_by
(
    id Int,
    val Int
)
ENGINE = MergeTree
ORDER BY tuple();

SELECT *
FROM limit_by
ORDER BY
    id ASC,
    val ASC
LIMIT 2, 2 BY id;

SELECT *
FROM limit_by
ORDER BY
    id ASC,
    val ASC
LIMIT 1, 2 BY id;

SELECT *
FROM limit_by
ORDER BY
    id ASC,
    val ASC
LIMIT 1, 2 BY id
LIMIT 3;

SELECT *
FROM limit_by
ORDER BY
    id ASC,
    val ASC
LIMIT 1, 2 BY id
LIMIT 3
OFFSET 1;