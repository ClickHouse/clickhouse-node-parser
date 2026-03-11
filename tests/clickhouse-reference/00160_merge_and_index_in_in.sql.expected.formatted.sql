SELECT
    *,
    b
FROM mt_00160
WHERE x IN (12345, 67890)
    AND NOT ignore(blockSize() < 10 AS b)
ORDER BY x ASC;

SELECT
    *,
    b
FROM merge_00160
WHERE x IN (12345, 67890)
    AND NOT ignore(blockSize() < 10 AS b)
ORDER BY x ASC;

SELECT
    *,
    b
FROM mt_00160
WHERE (z, y, x) IN ((617, 1244, 1234), (2839, 5688, 5678), (1,1,1))
    AND NOT ignore(blockSize() < 10 AS b)
ORDER BY (x, y, z) ASC;