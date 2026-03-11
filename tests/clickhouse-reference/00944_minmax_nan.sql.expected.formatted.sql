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
LIMIT 2, 3;

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
LIMIT 2, 3;

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
LIMIT 2, 3;

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
LIMIT 2, 3;