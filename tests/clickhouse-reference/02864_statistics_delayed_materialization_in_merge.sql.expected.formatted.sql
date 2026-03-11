SELECT replaceRegexpAll(`explain`, '__table1\\.', '')
FROM (
        EXPLAIN actions = 1
        SELECT count(*)
        FROM tab
        WHERE b < 10
            AND a < 10
    )
WHERE like(`explain`, '%Prewhere%');