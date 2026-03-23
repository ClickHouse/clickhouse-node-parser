CREATE TABLE t
(
    k UInt64,
    s String
)
ENGINE = MergeTree
ORDER BY k
SETTINGS old_parts_lifetime = 600;

INSERT INTO t;

SELECT *
FROM t;

SELECT
    name,
    is_frozen
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 't';

SELECT '---';

SET mutations_sync = 1;