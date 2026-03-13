-- order key can be pushed down with final
SELECT replaceRegexpAll(`explain`, '__table1\\.|_UInt8|_UInt16', '')
FROM (
        EXPLAIN actions = 1
        SELECT *
        FROM prewhere_move_select_final
        WHERE x > 100
    )
WHERE like(`explain`, '%Prewhere%');

SELECT replaceRegexpAll(`explain`, '__table1\\.|_UInt8|_UInt16', '')
FROM (
        EXPLAIN actions = 1
        SELECT *
        FROM prewhere_move_select_final FINAL
        WHERE x > 100
    )
WHERE like(`explain`, '%Prewhere%');

SELECT replaceRegexpAll(`explain`, '__table1\\.|_UInt8|_UInt16', '')
FROM (
        EXPLAIN actions = 1
        SELECT *
        FROM prewhere_move_select_final
        WHERE y > 100
    )
WHERE like(`explain`, '%Prewhere%');

SELECT replaceRegexpAll(`explain`, '__table1\\.|_UInt8|_UInt16', '')
FROM (
        EXPLAIN actions = 1
        SELECT *
        FROM prewhere_move_select_final FINAL
        WHERE y > 100
    )
WHERE like(`explain`, '%Prewhere%');

SELECT replaceRegexpAll(`explain`, '__table1\\.|_UInt8|_UInt16', '')
FROM (
        EXPLAIN actions = 1
        SELECT *
        FROM prewhere_move_select_final
        WHERE x + y > 100
    )
WHERE like(`explain`, '%Prewhere%');

SELECT replaceRegexpAll(`explain`, '__table1\\.|_UInt8|_UInt16', '')
FROM (
        EXPLAIN actions = 1
        SELECT *
        FROM prewhere_move_select_final FINAL
        WHERE x + y > 100
    )
WHERE like(`explain`, '%Prewhere%');

-- can not be pushed down
SELECT *
FROM (
        EXPLAIN actions = 1
        SELECT *
        FROM prewhere_move_select_final FINAL
        WHERE z > 400
    )
WHERE like(`explain`, '%Prewhere filter');

-- only condition with x/y can be pushed down
SELECT replaceRegexpAll(`explain`, '__table1\\.|_UInt8|_UInt16', '')
FROM (
        EXPLAIN actions = 1
        SELECT *
        FROM prewhere_move_select_final FINAL
        WHERE y > 100
            AND z > 400
    )
WHERE like(`explain`, '%Prewhere%')
    OR like(`explain`, '%Filter%');

SELECT replaceRegexpAll(`explain`, '__table1\\.|_UInt8|_UInt16', '')
FROM (
        EXPLAIN actions = 1
        SELECT *
        FROM prewhere_move_select_final FINAL
        WHERE x > 50
            AND z > 400
    )
WHERE like(`explain`, '%Prewhere%')
    OR like(`explain`, '%Filter%');

SELECT replaceRegexpAll(`explain`, '__table1\\.|_UInt8|_UInt16', '')
FROM (
        EXPLAIN actions = 1
        SELECT *
        FROM prewhere_move_select_final FINAL
        WHERE x + y > 50
            AND z > 400
    )
WHERE like(`explain`, '%Prewhere%')
    OR like(`explain`, '%Filter%');

SELECT replaceRegexpAll(`explain`, '__table1\\.|_UInt8|_UInt16', '')
FROM (
        EXPLAIN actions = 1
        SELECT *
        FROM prewhere_move_select_final FINAL
        WHERE z > 400
    )
WHERE like(`explain`, '%Prewhere%');

SELECT replaceRegexpAll(`explain`, '__table1\\.|_UInt8|_UInt16', '')
FROM (
        EXPLAIN actions = 1
        SELECT *
        FROM prewhere_move_select_final FINAL
        WHERE y > 100
            AND z > 400
    )
WHERE like(`explain`, '%Prewhere%');