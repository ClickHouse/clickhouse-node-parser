SELECT trimLeft(`explain`)
FROM (
        SELECT *
        FROM viewExplain('EXPLAIN', 'indexes = 1', (
                SELECT count()
                FROM test_lc_pk
                WHERE CAST(s, 'LowCardinality(String)') = '42'
            ))
    )
WHERE like(`explain`, '%Condition%');

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