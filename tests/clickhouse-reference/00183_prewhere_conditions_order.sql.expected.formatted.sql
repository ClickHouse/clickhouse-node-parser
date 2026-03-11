SELECT trimBoth(`explain`)
FROM (
        EXPLAIN actions = 1
        SELECT
            SearchPhrase,
            MIN(URL),
            MIN(Title),
            COUNT(*) AS c,
            COUNTDistinct(UserID)
        FROM test.hits
        WHERE like(Title, '%Google%')
            AND notLike(URL, '%.google.%')
            AND SearchPhrase <> ''
        GROUP BY SearchPhrase
        ORDER BY c DESC
        LIMIT 10
        SETTINGS allow_reorder_prewhere_conditions = 0
    )
WHERE like(`explain`, '%Prewhere filter column%');

SELECT trimBoth(`explain`)
FROM (
        EXPLAIN actions = 1
        SELECT
            SearchPhrase,
            MIN(URL),
            MIN(Title),
            COUNT(*) AS c,
            COUNTDistinct(UserID)
        FROM test.hits
        WHERE like(Title, '%Google%')
            AND notLike(URL, '%.google.%')
            AND SearchPhrase <> ''
        GROUP BY SearchPhrase
        ORDER BY c DESC
        LIMIT 10
        SETTINGS allow_reorder_prewhere_conditions = 1
    )
WHERE like(`explain`, '%Prewhere filter column%');