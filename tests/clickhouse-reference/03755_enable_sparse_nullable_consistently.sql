SELECT
    column,
    substreams
FROM system.parts_columns
WHERE (database = currentDatabase()) AND (`table` = 't') AND active;
