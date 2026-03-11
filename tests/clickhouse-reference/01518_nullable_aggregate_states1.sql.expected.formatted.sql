SELECT
    count(),
    count(a),
    max(a),
    min(a),
    avg(a),
    sum(a),
    any(a)
FROM (
        SELECT cast(NULL, 'Nullable(Float64)') AS a
    );

SELECT
    countMerge(cnts),
    countMerge(cntsa),
    maxMerge(maxs),
    minMerge(mins),
    avgMerge(avgs),
    sumMerge(sums),
    anyMerge(anys)
FROM (
        SELECT
            countState() AS cnts,
            countState(a) AS cntsa,
            maxState(a) AS maxs,
            minState(a) AS mins,
            avgState(a) AS avgs,
            sumState(a) AS sums,
            anyState(a) AS anys
        FROM (
                SELECT cast(NULL, 'Nullable(Float64)') AS a
            )
    );

SELECT '--- empty resultset ---';

SELECT
    count(),
    count(a),
    max(a),
    min(a),
    avg(a),
    sum(a),
    any(a)
FROM (
        SELECT cast(1, 'Nullable(Float64)') AS a
    )
WHERE a = 0;

SELECT
    countMerge(cnts),
    countMerge(cntsa),
    maxMerge(maxs),
    minMerge(mins),
    avgMerge(avgs),
    sumMerge(sums),
    anyMerge(anys)
FROM (
        SELECT
            countState() AS cnts,
            countState(a) AS cntsa,
            maxState(a) AS maxs,
            minState(a) AS mins,
            avgState(a) AS avgs,
            sumState(a) AS sums,
            anyState(a) AS anys
        FROM (
                SELECT cast(1, 'Nullable(Float64)') AS a
            )
        WHERE a = 0
    );