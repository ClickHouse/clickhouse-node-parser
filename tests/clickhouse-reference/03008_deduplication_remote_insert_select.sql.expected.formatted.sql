SELECT count()
FROM src;

SELECT
    a,
    sum(b),
    uniq(b)
FROM src
GROUP BY a
ORDER BY a ASC;

SELECT count()
FROM remote('127.0.0.{1..2}', currentDatabase(), src);

SELECT
    a,
    sumMerge(sum_b) AS sum_b,
    uniqMerge(uniq_b) AS uniq_b
FROM mv_dst
GROUP BY a
ORDER BY a ASC;