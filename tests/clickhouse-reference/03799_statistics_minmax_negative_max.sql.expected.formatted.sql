SELECT
    column,
    estimates.min,
    estimates.max
FROM `system`.parts_columns
WHERE database = currentDatabase()
    AND table = 'tab';