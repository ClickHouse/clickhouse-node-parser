CREATE TABLE t1
(
    id Int
)
ENGINE = TinyLog;

CREATE TABLE t2
(
    id Int
)
ENGINE = TinyLog;

SET min_joined_block_size_bytes = 0;

SET max_block_size = 100;

SELECT count() == 2222
FROM
    t1
INNER JOIN t2
    ON 1 = 1;

SELECT count() == 0
FROM
    t1
INNER JOIN t2
    ON 1 = 2;

SELECT count() == 2
FROM
    t1
LEFT JOIN t2
    ON 1 = 2;

SELECT count() == 1111
FROM
    t1
RIGHT JOIN t2
    ON 1 = 2;

SELECT count() == 1113
FROM
    t1
FULL JOIN t2
    ON 1 = 2;