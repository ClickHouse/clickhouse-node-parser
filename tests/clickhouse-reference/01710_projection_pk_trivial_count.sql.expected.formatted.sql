SELECT trimLeft(*)
FROM (
        EXPLAIN
        SELECT count()
        FROM x
        WHERE (i >= 3
            AND i <= 6)
            OR i = 7
    )
WHERE like(`explain`, '%ReadFromPreparedSource%')
    OR like(`explain`, '%ReadFromMergeTree%');

SELECT count()
FROM x
WHERE (i >= 3
    AND i <= 6)
    OR i = 7;