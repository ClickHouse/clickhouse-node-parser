SELECT COUNT(1) == 1
FROM `01504_test`;

SELECT COUNT(1) == 10000
FROM `01504_test`;

SELECT uniqExact(key) == 32
FROM (
        SELECT *
        FROM `01504_test`
        LIMIT 32
        SETTINGS max_block_size = 1
    );

SELECT SUM(value) == 1 + 99 + 900
FROM `01504_test`
WHERE key IN ('1_1', '99_1', '900_1');

SELECT
    A.a = B.a,
    A.b = B.b,
    A.c = B.c,
    A.d = B.d,
    A.e = B.e
FROM
    (
        SELECT
            0 AS a,
            groupBitmapMerge(bm) AS b,
            SUM(k) AS c,
            SUM(value) AS d,
            SUM(dummy.1) AS e
        FROM `01504_test`
    ) AS A
LEFT JOIN (
        SELECT
            0 AS a,
            groupBitmapMerge(bm) AS b,
            SUM(k) AS c,
            SUM(value) AS d,
            SUM(dummy.1) AS e
        FROM `01504_test_memory`
    ) AS B
    USING (a)
ORDER BY a ASC;

SELECT dummy == (1,1.2)
FROM `01504_test`
WHERE k IN (1, 3)
    OR k IN (1)
    OR k IN (3, 1)
    OR k IN ([1])
    OR k IN ([1, 3]);

SELECT k == 4
FROM `01504_test`
WHERE k = 4
    OR k IN ([4])
    OR k IN (4, 10000001, 10000002)
    AND value > 0;

SELECT k == 4
FROM `01504_test`
WHERE k IN (
        SELECT toUInt32(number)
        FROM keys
        WHERE number = 4
    );

SELECT
    k,
    value
FROM `01504_test`
WHERE k = 0
    OR value > 0;

SELECT
    k,
    value
FROM `01504_test`
WHERE k = 0
    AND k IN (1, 3)
    OR k > 8;

SELECT 0 == COUNT(1)
FROM `01504_test`;