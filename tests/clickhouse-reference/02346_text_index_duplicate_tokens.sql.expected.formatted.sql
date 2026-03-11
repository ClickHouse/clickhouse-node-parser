SELECT count()
FROM tab
WHERE like(s, '%Hello%')
    OR like(s, '%hello%');

SELECT trim(`explain`)
FROM (
        EXPLAIN actions = 1
        SELECT count()
        FROM tab
        WHERE like(s, '%Hello%')
            OR like(s, '%hello%')
        SETTINGS use_skip_indexes_on_data_read = 1
    )
WHERE like(`explain`, '%Filter column%');

SELECT count()
FROM tab
WHERE like(s, 'Hello,%')
    OR like(s, 'hello,%');

SELECT trim(`explain`)
FROM (
        EXPLAIN actions = 1, indexes = 1
        SELECT count()
        FROM tab
        WHERE like(s, 'Hello,%')
            OR like(s, 'hello,%')
        SETTINGS use_skip_indexes_on_data_read = 1
    )
WHERE like(`explain`, '%Filter column%');