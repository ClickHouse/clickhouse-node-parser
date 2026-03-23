-- In previous ClickHouse versions, parts were not 100% immutable and FREEZE may prevent subsequent ALTERs.
-- It's not longer the case. Let's prove it.
DROP TABLE IF EXISTS t;

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

DROP TABLE t;