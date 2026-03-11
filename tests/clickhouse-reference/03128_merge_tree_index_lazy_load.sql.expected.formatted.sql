SELECT
    mark_number,
    a,
    b
FROM mergeTreeIndex(currentDatabase(), t_index_lazy_load)
ORDER BY mark_number ASC;