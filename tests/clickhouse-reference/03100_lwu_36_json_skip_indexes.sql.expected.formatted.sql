SELECT *
FROM test
WHERE document.name = 'aaa'
    OR document.name = 'boo'
ORDER BY id ASC
SETTINGS apply_patch_parts = 1;

SELECT trim(`explain`) AS s
FROM (
        EXPLAIN indexes = 1
        SELECT *
        FROM test
        WHERE document.name = 'aaa'
            OR document.name = 'boo'
        ORDER BY id ASC
        SETTINGS apply_patch_parts = 1
    )
WHERE like(s, 'Granules: %');

SELECT *
FROM test
WHERE document.name = 'aaa'
    OR document.name = 'boo'
ORDER BY id ASC
SETTINGS apply_patch_parts = 0;

SELECT trim(`explain`) AS s
FROM (
        EXPLAIN indexes = 1
        SELECT *
        FROM test
        WHERE document.name = 'aaa'
            OR document.name = 'boo'
        ORDER BY id ASC
        SETTINGS apply_patch_parts = 0
    )
WHERE like(s, 'Granules: %');

SELECT count()
FROM test
WHERE document.country::String = 'USA'
SETTINGS apply_patch_parts = 1;

SELECT trim(`explain`) AS s
FROM (
        EXPLAIN indexes = 1
        SELECT count()
        FROM test
        WHERE document.country::String = 'USA'
        SETTINGS apply_patch_parts = 1
    )
WHERE like(s, 'Granules: %');

SELECT count()
FROM test
WHERE document.country::String = 'USA'
SETTINGS apply_patch_parts = 0;

SELECT trim(`explain`) AS s
FROM (
        EXPLAIN indexes = 1
        SELECT count()
        FROM test
        WHERE document.country::String = 'USA'
        SETTINGS apply_patch_parts = 0
    )
WHERE like(s, 'Granules: %');