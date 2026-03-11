SELECT
    sum(`rows`),
    groupUniqArray(type)
FROM `system`.parts_columns
WHERE database = currentDatabase()
    AND table = 't_ttl_modify_column'
    AND column = 'TTLDays'
    AND active;

SELECT
    sum(`rows`),
    groupUniqArray(type)
FROM `system`.parts_columns
WHERE database = currentDatabase()
    AND table = 't_ttl_modify_column'
    AND column = 'InsertionDateTime'
    AND active;