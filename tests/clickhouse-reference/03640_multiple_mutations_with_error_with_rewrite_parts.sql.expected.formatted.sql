CREATE TABLE t0
(
    c0 Nullable(String)
)
ENGINE = MergeTree()
ORDER BY tuple()
SETTINGS allow_nullable_key = 1;

SELECT *
FROM `system`.mutations
WHERE database = currentDatabase()
    AND NOT is_done
FORMAT Vertical;