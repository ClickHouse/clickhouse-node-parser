SELECT *
FROM t_02559
WHERE ((key < 5
    OR key > 500))
    AND NOT has(value, toString(key))
    AND length(value) == 1
LIMIT 10
SETTINGS
    max_block_size = 81,
    max_threads = 1;