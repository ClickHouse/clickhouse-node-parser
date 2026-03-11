SELECT '-- splitByNonAlpha';

SELECT count()
FROM tab
WHERE s = '5555';

SELECT trim(`explain`)
FROM (
        EXPLAIN actions = 1
        SELECT count()
        FROM tab
        WHERE s = '5555'
        SETTINGS use_skip_indexes_on_data_read = 1
    )
WHERE ilike(`explain`, '%filter column%');

SELECT count()
FROM tab
WHERE like(s, '%5555%');

SELECT trim(`explain`)
FROM (
        EXPLAIN actions = 1
        SELECT count()
        FROM tab
        WHERE like(s, '%5555%')
        SETTINGS use_skip_indexes_on_data_read = 1
    )
WHERE ilike(`explain`, '%filter column%');