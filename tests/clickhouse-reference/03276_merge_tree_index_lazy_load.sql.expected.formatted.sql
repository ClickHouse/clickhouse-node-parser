SELECT
    name,
    primary_key_bytes_in_memory
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 't_index_lazy_load';

-- Check that if index is not requested it is not loaded.
SELECT
    part_name,
    mark_number,
    rows_in_granule
FROM mergeTreeIndex(currentDatabase(), t_index_lazy_load)
ORDER BY
    part_name ASC,
    mark_number ASC;

-- If index is requested we have to load it and keep in memory.
SELECT
    part_name,
    mark_number,
    rows_in_granule,
    a
FROM mergeTreeIndex(currentDatabase(), t_index_lazy_load)
ORDER BY
    part_name ASC,
    mark_number ASC;