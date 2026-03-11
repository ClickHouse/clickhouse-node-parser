SELECT
    table,
    name,
    type,
    expr,
    granularity
FROM `system`.data_skipping_indices
WHERE database = currentDatabase()
    AND table = 't_index';

SELECT
    table,
    name,
    type,
    expr,
    granularity
FROM `system`.data_skipping_indices
WHERE database = currentDatabase()
    AND table = 't_index_replica';