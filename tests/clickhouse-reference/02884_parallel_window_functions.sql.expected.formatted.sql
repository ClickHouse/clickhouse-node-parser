SELECT count()
FROM (
        EXPLAIN PIPELINE
        SELECT
            nw,
            sum(WR) AS R,
            sumIf(WR, uniq_rows = 1) AS UNR
        FROM (
                SELECT
                    uniq(nw) OVER (PARTITION BY ac) AS uniq_rows,
                    AVG(wg) AS WR,
                    ac,
                    nw
                FROM window_function_threading
                GROUP BY
                    ac,
                    nw
            )
        GROUP BY nw
        ORDER BY
            nw ASC,
            R DESC
        LIMIT 10
    )
WHERE ilike(`explain`, '%ScatterByPartitionTransform%')
SETTINGS max_threads = 4;

SELECT
    nw,
    sum(WR) AS R,
    sumIf(WR, uniq_rows = 1) AS UNR
FROM (
        SELECT
            uniq(nw) OVER (PARTITION BY ac) AS uniq_rows,
            AVG(wg) AS WR,
            ac,
            nw
        FROM window_function_threading
        GROUP BY
            ac,
            nw
    )
GROUP BY nw
ORDER BY
    nw ASC,
    R DESC
LIMIT 10;

SELECT
    nw,
    sum(WR) AS R,
    sumIf(WR, uniq_rows = 1) AS UNR
FROM (
        SELECT
            uniq(nw) OVER (PARTITION BY ac) AS uniq_rows,
            AVG(wg) AS WR,
            ac,
            nw
        FROM window_function_threading
        GROUP BY
            ac,
            nw
    )
GROUP BY nw
ORDER BY
    nw ASC,
    R DESC
LIMIT 10
SETTINGS max_threads = 1;

SELECT
    nw,
    sum(WR) AS R,
    sumIf(WR, uniq_rows = 1) AS UNR
FROM (
        SELECT
            uniq(nw) OVER (PARTITION BY ac) AS uniq_rows,
            AVG(wg) AS WR,
            ac,
            nw
        FROM window_function_threading
        WHERE (ac % 4) = 0
        GROUP BY
            ac,
            nw
        UNION ALL
        SELECT
            uniq(nw) OVER (PARTITION BY ac) AS uniq_rows,
            AVG(wg) AS WR,
            ac,
            nw
        FROM window_function_threading
        WHERE (ac % 4) = 1
        GROUP BY
            ac,
            nw
        UNION ALL
        SELECT
            uniq(nw) OVER (PARTITION BY ac) AS uniq_rows,
            AVG(wg) AS WR,
            ac,
            nw
        FROM window_function_threading
        WHERE (ac % 4) = 2
        GROUP BY
            ac,
            nw
        UNION ALL
        SELECT
            uniq(nw) OVER (PARTITION BY ac) AS uniq_rows,
            AVG(wg) AS WR,
            ac,
            nw
        FROM window_function_threading
        WHERE (ac % 4) = 3
        GROUP BY
            ac,
            nw
    )
GROUP BY nw
ORDER BY
    nw ASC,
    R DESC
LIMIT 10;