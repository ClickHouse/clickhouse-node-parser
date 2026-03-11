SELECT count() FROM tab WHERE col = nan;
SELECT count() FROM tab WHERE col <> nan;
SELECT count() FROM tab WHERE col = -nan;
SELECT count() FROM tab WHERE col <> -nan;
SELECT count() FROM tab WHERE isNaN(col);
SELECT count() FROM tab WHERE NOT isNaN(col);
SELECT trimLeft(explain) AS explain FROM (
    EXPLAIN indexes=1
    SELECT count() FROM tab WHERE col = nan
)
WHERE explain LIKE '%Description:%' OR explain LIKE '%Parts:%' OR explain LIKE '%Granules:%'
LIMIT 2, 3; -- Skip the primary index parts and granules.
SELECT trimLeft(explain) AS explain FROM (
    EXPLAIN indexes=1
    SELECT count() FROM tab WHERE col = -nan
)
WHERE explain LIKE '%Description:%' OR explain LIKE '%Parts:%' OR explain LIKE '%Granules:%'
LIMIT 2, 3; -- Skip the primary index parts and granules.
SELECT trimLeft(explain) AS explain FROM (
    EXPLAIN indexes=1
    SELECT count() FROM tab WHERE col <> nan
)
WHERE explain LIKE '%Description:%' OR explain LIKE '%Parts:%' OR explain LIKE '%Granules:%'
LIMIT 2, 3; -- Skip the primary index parts and granules.
SELECT trimLeft(explain) AS explain FROM (
    EXPLAIN indexes=1
    SELECT count() FROM tab WHERE col <> -nan
)
WHERE explain LIKE '%Description:%' OR explain LIKE '%Parts:%' OR explain LIKE '%Granules:%'
LIMIT 2, 3; -- Skip the primary index parts and granules.
