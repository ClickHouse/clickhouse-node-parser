SET parallel_replicas_local_plan = 1;

CREATE TABLE tab
(
    id UInt64,
    col Float,
    INDEX col_idx col TYPE minmax
)
ENGINE = MergeTree()
ORDER BY id; -- This is important. We want to have additional primary index that does not use the column `col`.

SELECT count()
FROM tab
WHERE col = nan;

SELECT count()
FROM tab
WHERE col <> nan;

SELECT count()
FROM tab
WHERE col = -nan;

SELECT count()
FROM tab
WHERE col <> -nan;

SELECT count()
FROM tab
WHERE isNaN(col);

SELECT count()
FROM tab
WHERE NOT isNaN(col);

SELECT trimLeft(`explain`) AS `explain`
FROM (
        EXPLAIN indexes = 1
        SELECT count()
        FROM tab
        WHERE col = nan
    )
WHERE like(`explain`, '%Description:%')
    OR like(`explain`, '%Parts:%')
    OR like(`explain`, '%Granules:%')
LIMIT 2, 3; -- Skip the primary index parts and granules.

SELECT trimLeft(`explain`) AS `explain`
FROM (
        EXPLAIN indexes = 1
        SELECT count()
        FROM tab
        WHERE col = -nan
    )
WHERE like(`explain`, '%Description:%')
    OR like(`explain`, '%Parts:%')
    OR like(`explain`, '%Granules:%')
LIMIT 2, 3; -- Skip the primary index parts and granules.

SELECT trimLeft(`explain`) AS `explain`
FROM (
        EXPLAIN indexes = 1
        SELECT count()
        FROM tab
        WHERE col <> nan
    )
WHERE like(`explain`, '%Description:%')
    OR like(`explain`, '%Parts:%')
    OR like(`explain`, '%Granules:%')
LIMIT 2, 3; -- Skip the primary index parts and granules.

SELECT trimLeft(`explain`) AS `explain`
FROM (
        EXPLAIN indexes = 1
        SELECT count()
        FROM tab
        WHERE col <> -nan
    )
WHERE like(`explain`, '%Description:%')
    OR like(`explain`, '%Parts:%')
    OR like(`explain`, '%Granules:%')
LIMIT 2, 3; -- Skip the primary index parts and granules.