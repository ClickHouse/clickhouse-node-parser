SELECT trimLeft(`explain`)
FROM (
        SELECT *
        FROM viewExplain('EXPLAIN', 'indexes = 1', (
                SELECT count()
                FROM test_lc_pk
                WHERE CAST(s, 'LowCardinality(String)') = '42'
            ))
    )
WHERE like(`explain`, '%Condition%'); -- We basically try to verify that we have our column as the key in explain indexes (we don't read all data)

SELECT trimLeft(`explain`)
FROM (
        SELECT *
        FROM viewExplain('EXPLAIN', 'indexes = 1', (
                SELECT count()
                FROM test_lc_pk
                WHERE CAST(s, 'String') = '42'
            ))
    )
WHERE like(`explain`, '%Condition%');