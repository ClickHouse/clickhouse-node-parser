SELECT
    name,
    type,
    serialization_kind
FROM `system`.parts_columns
WHERE database = currentDatabase()
    AND table = 't_modify_to_nullable'
    AND column = 's'
    AND active
ORDER BY name ASC;

SELECT
    count(s),
    countIf(s != ''),
    arraySort(groupUniqArray(s))
FROM t_modify_to_nullable;

SELECT
    part_name,
    read_rows
FROM `system`.part_log
WHERE database = currentDatabase()
    AND table = 't_modify_to_nullable'
    AND event_type = 'MutatePart'
ORDER BY part_name ASC;