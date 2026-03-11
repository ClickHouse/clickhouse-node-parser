SELECT *
FROM remote('127.{2..11}', view((
        SELECT *
        FROM numbers(1e6)
    )))
GROUP BY number
ORDER BY number ASC
LIMIT 20
SETTINGS
    distributed_group_by_no_merge = 0,
    max_memory_usage = '100Mi';

SELECT *
FROM remote('127.{2..11}', view((
        SELECT *
        FROM numbers(1e6)
    )))
GROUP BY number
ORDER BY number ASC
LIMIT 20
SETTINGS
    distributed_group_by_no_merge = 2,
    max_memory_usage = '100Mi';

SELECT *
FROM remote('127.{2..11}', view((
        SELECT *
        FROM numbers(1e6)
    )))
GROUP BY number
ORDER BY number ASC
LIMIT 1e6
SETTINGS
    distributed_group_by_no_merge = 2,
    max_memory_usage = '20Mi',
    max_block_size = 4294967296;

SELECT *
FROM remote('127.{2..11}', currentDatabase(), data_01730)
GROUP BY key
ORDER BY key ASC
LIMIT 1e6
SETTINGS
    distributed_group_by_no_merge = 2,
    max_memory_usage = '100Mi',
    optimize_aggregation_in_order = 1,
    max_threads = 10
FORMAT Null;