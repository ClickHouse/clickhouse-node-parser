SELECT '---';

SELECT
    table,
    name,
    type
FROM `system`.data_skipping_indices
WHERE database = currentDatabase()
    AND table = 'tab';