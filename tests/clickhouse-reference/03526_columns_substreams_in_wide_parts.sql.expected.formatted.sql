SELECT
    column,
    type,
    substreams,
    filenames
FROM `system`.parts_columns
WHERE database = currentDatabase()
    AND table = 'test'
    AND active;

SELECT '-------------------------------------------------------------------------';