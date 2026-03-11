SELECT i
FROM x;

SELECT minmax_dt.1 == minmax_dt.2
FROM mergeTreeIndex(currentDatabase(), x, with_minmax = 1);

SELECT (
        SELECT min(dt)
        FROM x
    ) == (
        SELECT minDistinct(dt)
        FROM x
    );