SELECT *
FROM test_01676.table
ORDER BY x ASC;

SELECT status
FROM `system`.dictionaries
WHERE database = 'test_01676'
    AND name = 'dict';

SELECT COALESCE((
        SELECT status
        FROM `system`.dictionaries
        WHERE database = 'test_01676'
            AND name = 'dict'
    )::Nullable(String), 'NOT_LOADED');