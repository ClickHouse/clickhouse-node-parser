CREATE TABLE `ties`
(
    id UInt8
)
ENGINE = MergeTree
ORDER BY tuple();

SELECT id
FROM `ties`
ORDER BY id ASC
LIMIT 0.1 WITH TIES;

SELECT id
FROM `ties`
ORDER BY id ASC
LIMIT 0.2 WITH TIES;

SELECT id
FROM `ties`
ORDER BY id ASC
LIMIT 0.3 WITH TIES;

SELECT id
FROM `ties`
ORDER BY id ASC
LIMIT 0.5 WITH TIES;

SELECT id
FROM `ties`
ORDER BY id ASC
LIMIT 0.6 WITH TIES;

SELECT id
FROM `ties`
ORDER BY id ASC
LIMIT 0.7 WITH TIES;

SELECT id
FROM `ties`
ORDER BY id ASC
LIMIT 0.9 WITH TIES;

SELECT id
FROM `ties`
ORDER BY id ASC;

SET max_block_size = 2;

SELECT id
FROM `ties`
ORDER BY id ASC
LIMIT 1, 0.1 WITH TIES;

SELECT id
FROM `ties`
ORDER BY id ASC
LIMIT 2, 0.1 WITH TIES;

SELECT id
FROM `ties`
ORDER BY id ASC
LIMIT 3, 0.1 WITH TIES;

SELECT id
FROM `ties`
ORDER BY id ASC
LIMIT 0.4, 0.1 WITH TIES;

SELECT id
FROM `ties`
ORDER BY id ASC
LIMIT 0.8, 0.1 WITH TIES;

SET max_block_size = 3;

SET max_block_size = 10;

SELECT number
FROM numbers(50)
ORDER BY number ASC
LIMIT 0.3 WITH TIES;

SET max_block_size = 5;

SELECT number
FROM numbers(33)
ORDER BY number ASC
LIMIT 0.33 WITH TIES;

SELECT count()
FROM (
        SELECT number > 100 AS n
        FROM numbers(2000)
        ORDER BY n ASC
        LIMIT 1, 0.01 WITH TIES
    );

SELECT count()
FROM (
        SELECT number < 100 AS n
        FROM numbers(2000)
        ORDER BY n DESC
        LIMIT 0.03 WITH TIES
    );

SELECT count()
FROM (
        SELECT number DIV 10 AS n
        FROM numbers(20)
        ORDER BY n ASC
        LIMIT 0.25 WITH TIES
    );