CREATE TABLE per_table_ttl_02265
(
    key Int,
    date Date,
    value String
)
ENGINE = MergeTree()
ORDER BY key;

SELECT count()
FROM `system`.mutations
WHERE database = currentDatabase()
    AND table = 'per_table_ttl_02265';