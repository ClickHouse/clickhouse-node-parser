SELECT
    blockSize() AS b,
    count() / b AS c
FROM numbers_squashed
GROUP BY blockSize()
ORDER BY
    c DESC,
    b ASC;

SELECT count()
FROM numbers_squashed;