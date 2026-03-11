SELECT *
FROM prewhere_column_missing;

SELECT
    *,
    arraySum(arr) AS s
FROM prewhere_column_missing;

SELECT
    *,
    arraySum(arr) AS s
FROM prewhere_column_missing
WHERE s = 0;

SELECT
    *,
    arraySum(arr) AS s
FROM prewhere_column_missing
PREWHERE s = 0;

SELECT
    *,
    length(arr) AS l
FROM prewhere_column_missing;

SELECT
    *,
    length(arr) AS l
FROM prewhere_column_missing
WHERE l = 0;

SELECT
    *,
    length(arr) AS l
FROM prewhere_column_missing
PREWHERE l = 0;

SELECT *
FROM prewhere_column_missing
WHERE hash_x = intHash64(x);

SELECT *
FROM prewhere_column_missing
PREWHERE hash_x = intHash64(x);

SELECT *
FROM prewhere_column_missing
WHERE hash_x = intHash64(x)
    AND length(arr) = 0;

SELECT *
FROM prewhere_column_missing
PREWHERE hash_x = intHash64(x)
    AND length(arr) = 0;

SELECT *
FROM prewhere_column_missing
WHERE hash_x = intHash64(x)
    AND length(arr) = 0
    AND arraySum(arr) = 0;

SELECT *
FROM prewhere_column_missing
PREWHERE hash_x = intHash64(x)
    AND length(arr) = 0
    AND arraySum(arr) = 0;