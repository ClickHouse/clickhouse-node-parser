SET max_block_size = 10;

SELECT number
FROM numbers(20)
ORDER BY number ASC
LIMIT 0.5 WITH TIES;

SELECT number
FROM numbers(20)
ORDER BY number ASC
LIMIT 0.9 WITH TIES;

SELECT number
FROM numbers(10)
ORDER BY number ASC
LIMIT 0.1 WITH TIES;

SET max_block_size = 3;

SELECT number
FROM numbers(20)
ORDER BY number ASC
LIMIT 5, 0.5 WITH TIES;

SELECT number
FROM numbers(20)
ORDER BY number ASC
LIMIT 12, 0.25 WITH TIES;

SELECT number
FROM numbers(20)
ORDER BY number ASC
LIMIT 10, 0.5 WITH TIES;

SELECT number
FROM numbers(20)
ORDER BY number ASC
LIMIT 5, 0.9 WITH TIES;

SELECT number
FROM numbers(15)
ORDER BY number ASC
LIMIT 5, 0.5 WITH TIES;

SELECT number
FROM numbers(14)
ORDER BY number ASC
LIMIT 5, 0.5 WITH TIES;

SELECT number
FROM numbers(20)
ORDER BY number ASC
LIMIT 5, 0.25 WITH TIES;

SELECT number
FROM numbers(20)
ORDER BY number ASC
LIMIT 15, 0.5 WITH TIES;

SELECT number
FROM numbers(20)
ORDER BY number ASC
LIMIT 5, 0.05 WITH TIES;

SELECT number
FROM numbers(20)
ORDER BY number ASC
LIMIT 0.25, 0.5 WITH TIES;

SELECT number
FROM numbers(20)
ORDER BY number ASC
LIMIT 0.6, 0.25 WITH TIES;

SELECT number
FROM numbers(20)
ORDER BY number ASC
LIMIT 0.5, 0.5 WITH TIES;

SELECT number
FROM numbers(20)
ORDER BY number ASC
LIMIT 0.25, 0.9 WITH TIES;

SELECT number
FROM numbers(20)
ORDER BY number ASC
LIMIT 0.25, 0.25 WITH TIES;

SELECT number
FROM numbers(15)
ORDER BY number ASC
LIMIT 0.33, 0.5 WITH TIES;

SELECT number
FROM numbers(20)
ORDER BY number ASC
LIMIT 0.25, 0.05 WITH TIES;