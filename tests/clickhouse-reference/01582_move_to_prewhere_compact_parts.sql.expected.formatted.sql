SELECT replaceRegexpAll(`explain`, '__table1\\.|_UInt8', '')
FROM (
        EXPLAIN actions = 1
        SELECT *
        FROM prewhere_move
        WHERE x > 100
    )
WHERE like(`explain`, '%Prewhere%')
    OR like(`explain`, '%Filter%');

SELECT replaceRegexpAll(`explain`, '__table1\\.|_UInt8|_String', '')
FROM (
        EXPLAIN actions = 1
        SELECT *
        FROM prewhere_move
        WHERE x1 > 100
            AND x2 > 100
            AND x3 > 100
            AND x4 > '100'
    )
WHERE like(`explain`, '%Prewhere%')
    OR like(`explain`, '%Filter%');