SELECT *
FROM mergeTreeIndex(currentDatabase(), t_index_granularity)
ORDER BY `ALL` ASC;

SELECT
    name,
    index_granularity_bytes_in_memory
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 't_index_granularity'
    AND active;