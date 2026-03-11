SELECT number
FROM numbers_mt(120)
WHERE (number % 10) = 0
ORDER BY number ASC
SETTINGS max_block_size = 31, max_threads = 11;
SELECT number
FROM numbers_mt(4242, 9)
WHERE (number % 10) = 0
ORDER BY number ASC
SETTINGS max_block_size = 31, max_threads = 11;
