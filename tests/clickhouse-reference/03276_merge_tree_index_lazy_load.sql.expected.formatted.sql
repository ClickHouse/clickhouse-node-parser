SELECT
    name,
    primary_key_bytes_in_memory
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 't_index_lazy_load';

SELECT
    part_name,
    mark_number,
    rows_in_granule
FROM mergeTreeIndex(currentDatabase(), t_index_lazy_load)
ORDER BY
    part_name ASC,
    mark_number ASC;

SELECT
    part_name,
    mark_number,
    rows_in_granule,
    a
FROM mergeTreeIndex(currentDatabase(), t_index_lazy_load)
ORDER BY
    part_name ASC,
    mark_number ASC;