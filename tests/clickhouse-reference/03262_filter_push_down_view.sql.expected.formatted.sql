SELECT trimLeft(`explain`)
FROM (
        EXPLAIN indexes = 1
        SELECT auid
        FROM alpha__day
        WHERE auid = 1
    )
WHERE like(`explain`, '%Condition:%')
    OR like(`explain`, '%Granules:%')
SETTINGS enable_analyzer = 1;