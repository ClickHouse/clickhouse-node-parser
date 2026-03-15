-- Testcase for bug #85897
-- If skip index is part of primary key, then optimization 'use_skip_indexes_if_final_exact_mode' should
-- not perform additional primary key intersection expand step.
SET use_skip_indexes_if_final = 1;

SET use_skip_indexes_if_final_exact_mode = 1;

CREATE TABLE tab
(
    id1 UInt32,
    id2 UInt32,
    v UInt32,
    INDEX id2_idx id2 TYPE minmax,
    INDEX v_idx v TYPE minmax
)
ENGINE = ReplacingMergeTree
ORDER BY (id1, id2)
SETTINGS index_granularity = 4;

SELECT trimLeft(`explain`) AS `explain`
FROM (
        EXPLAIN indexes = 1
        SELECT count(*)
        FROM tab FINAL
        WHERE v = 222
    )
WHERE ilike(`explain`, '%PrimaryKeyExpand%');

SELECT trimLeft(`explain`) AS `explain`
FROM (
        EXPLAIN indexes = 1
        SELECT count(*)
        FROM tab FINAL
        WHERE id2 = 222
    )
WHERE ilike(`explain`, '%PrimaryKeyExpand%');

CREATE TABLE t0
(
    c0 Int64,
    INDEX i1 c0 TYPE set(0)
)
ENGINE = SummingMergeTree()
ORDER BY (c0)
PARTITION BY (c0);

SELECT rank() OVER ()
FROM t0 FINAL
WHERE t0.c0 > 0.1
FORMAT null;