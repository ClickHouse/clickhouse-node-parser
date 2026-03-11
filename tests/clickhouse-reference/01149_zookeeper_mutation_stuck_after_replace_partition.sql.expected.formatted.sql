SELECT *
FROM rmt;

SELECT *
FROM mt;

SELECT
    table,
    partition_id,
    name,
    `rows`
FROM `system`.parts
WHERE database = currentDatabase()
    AND table IN ('mt', 'rmt')
    AND active = 1
ORDER BY
    table ASC,
    name ASC;

SELECT
    mutation_id,
    command,
    parts_to_do_names,
    parts_to_do,
    is_done
FROM `system`.mutations
WHERE database = currentDatabase()
    AND table = 'rmt';