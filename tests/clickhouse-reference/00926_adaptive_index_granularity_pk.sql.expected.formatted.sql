SELECT '----00489----';

SELECT
    toUInt32(x),
    y,
    z
FROM pk
WHERE and(greaterOrEquals(x, toDateTime(0)), lessOrEquals(x, toDateTime(59)));

SELECT
    toUInt32(x),
    y,
    z
FROM pk
WHERE and(greaterOrEquals(x, toDateTime(120)), lessOrEquals(x, toDateTime(240)));

SELECT
    toUInt32(x),
    y,
    z
FROM pk
WHERE x = toDateTime(1);

SELECT
    toUInt32(x),
    y,
    z
FROM pk
WHERE (and(greaterOrEquals(x, toDateTime(60)), lessOrEquals(x, toDateTime(119))))
    AND y = 11;

SELECT
    toUInt32(x),
    y,
    z
FROM pk
WHERE (and(greaterOrEquals(x, toDateTime(60)), lessOrEquals(x, toDateTime(120))))
    AND y = 11;

SELECT count()
FROM merge_tree
WHERE x = 0;

SELECT count()
FROM merge_tree
WHERE toUInt32(x) = 0;

SELECT count()
FROM merge_tree
WHERE toUInt64(x) = 0;

SELECT count()
FROM merge_tree
WHERE x IN (0, 0);

SELECT count()
FROM merge_tree
WHERE toUInt32(x) IN (0, 0);

SELECT count()
FROM merge_tree
WHERE toUInt64(x) IN (0, 0);

SELECT COUNT(hash)
FROM store_of_hash_00926;

SELECT COUNTDistinct(hash)
FROM store_of_hash_00926;