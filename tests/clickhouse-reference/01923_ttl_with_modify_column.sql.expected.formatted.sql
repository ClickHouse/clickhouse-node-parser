CREATE TABLE t_ttl_modify_column
(
    InsertionDateTime DateTime,
    TTLDays Int32 DEFAULT CAST(365, 'Int32')
)
ENGINE = MergeTree
ORDER BY tuple()
TTL InsertionDateTime + toIntervalDay(TTLDays)
SETTINGS min_bytes_for_wide_part = 0;

SET mutations_sync = 2;

SELECT
    sum(`rows`),
    groupUniqArray(type)
FROM `system`.parts_columns
WHERE database = currentDatabase()
    AND table = 't_ttl_modify_column'
    AND column = 'TTLDays'
    AND active;

CREATE TABLE t_ttl_modify_column
(
    InsertionDateTime DateTime
)
ENGINE = MergeTree
ORDER BY tuple()
TTL InsertionDateTime + toIntervalDay(3)
SETTINGS min_bytes_for_wide_part = 0;

SELECT
    sum(`rows`),
    groupUniqArray(type)
FROM `system`.parts_columns
WHERE database = currentDatabase()
    AND table = 't_ttl_modify_column'
    AND column = 'InsertionDateTime'
    AND active;