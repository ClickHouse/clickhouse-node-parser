SELECT replaceRegexpAll(`explain`, '__table1\\.|_UInt8', '')
FROM (
        EXPLAIN actions = 1
        SELECT count()
        FROM t_02848_mt1
        WHERE k = 3
            AND notEmpty(v)
    )
WHERE like(`explain`, '%Prewhere filter%')
    OR like(`explain`, '%Filter%');

SELECT count()
FROM t_02848_mt1
WHERE k = 3
    AND notEmpty(v);

SELECT replaceRegexpAll(`explain`, '__table1\\.|_UInt8|_String', '')
FROM (
        EXPLAIN actions = 1
        SELECT count()
        FROM t_02848_mt2
        WHERE a = 3
            AND b == '3'
            AND c < 20
            AND like(d, '%es%')
    )
WHERE like(`explain`, '%Prewhere filter%')
    OR like(`explain`, '%Filter%');

SELECT count()
FROM t_02848_mt2
WHERE a = 3
    AND b == '3'
    AND c < 20
    AND like(d, '%es%');

SELECT replaceRegexpAll(`explain`, '__table1\\.|_UInt8|_String', '')
FROM (
        EXPLAIN actions = 1
        SELECT count()
        FROM t_02848_mt2
        WHERE a = 3
            AND c < 20
            AND c > 0
            AND like(d, '%es%')
    )
WHERE like(`explain`, '%Prewhere filter%')
    OR like(`explain`, '%Filter%');

SELECT count()
FROM t_02848_mt2
WHERE a = 3
    AND c < 20
    AND c > 0
    AND like(d, '%es%');

SELECT replaceRegexpAll(`explain`, '__table1\\.|_UInt8|_String', '')
FROM (
        EXPLAIN actions = 1
        SELECT count()
        FROM t_02848_mt2
        WHERE b == '3'
            AND c < 20
            AND like(d, '%es%')
    )
WHERE like(`explain`, '%Prewhere filter%')
    OR like(`explain`, '%Filter%');

SELECT count()
FROM t_02848_mt2
WHERE b == '3'
    AND c < 20
    AND like(d, '%es%');

SELECT replaceRegexpAll(`explain`, '__table1\\.|_UInt8|_String', '')
FROM (
        EXPLAIN actions = 1
        SELECT count()
        FROM t_02848_mt2
        WHERE a = 3
            AND b == '3'
            AND like(d, '%es%')
    )
WHERE like(`explain`, '%Prewhere filter%')
    OR like(`explain`, '%Filter%');

SELECT count()
FROM t_02848_mt2
WHERE a = 3
    AND b == '3'
    AND like(d, '%es%');