SELECT
    column,
    type,
    statistics,
    estimates.cardinality,
    estimates.min,
    estimates.max
FROM `system`.parts_columns
WHERE table = 't_alter_auto_statistics'
    AND database = currentDatabase()
    AND active = 1
ORDER BY
    name ASC,
    column ASC;