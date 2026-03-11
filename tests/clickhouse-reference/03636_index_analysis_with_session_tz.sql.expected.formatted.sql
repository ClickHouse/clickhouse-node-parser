SELECT '-- PK UTC timezone';

SELECT count()
FROM `03636_data_pk`
WHERE ts = 1756882680;

SELECT trim(`explain`)
FROM (
        EXPLAIN indexes = 1
        SELECT count()
        FROM `03636_data_pk`
        WHERE ts = 1756882680
    )
WHERE ilike(trim(`explain`), 'condition: %')
    OR ilike(trim(`explain`), 'parts: %')
    OR ilike(trim(`explain`), 'granules: %');

SELECT count()
FROM `03636_data_pk`
WHERE ts = 1756882680
SETTINGS session_timezone = 'EST';

SELECT trim(`explain`)
FROM (
        EXPLAIN indexes = 1
        SELECT count()
        FROM `03636_data_pk`
        WHERE ts = 1756882680
    )
WHERE ilike(trim(`explain`), 'condition: %')
    OR ilike(trim(`explain`), 'parts: %')
    OR ilike(trim(`explain`), 'granules: %')
SETTINGS session_timezone = 'EST';

SELECT count()
FROM `03636_data_partitions`
WHERE ts = 1756882680;

SELECT trim(`explain`)
FROM (
        EXPLAIN indexes = 1
        SELECT count()
        FROM `03636_data_partitions`
        WHERE ts = 1756882680
    )
WHERE ilike(trim(`explain`), 'condition: %')
    OR ilike(trim(`explain`), 'parts: %')
    OR ilike(trim(`explain`), 'granules: %');

SELECT count()
FROM `03636_data_partitions`
WHERE ts = 1756882680
SETTINGS session_timezone = 'EST';

SELECT trim(`explain`)
FROM (
        EXPLAIN indexes = 1
        SELECT count()
        FROM `03636_data_partitions`
        WHERE ts = 1756882680
    )
WHERE ilike(trim(`explain`), 'condition: %')
    OR ilike(trim(`explain`), 'parts: %')
    OR ilike(trim(`explain`), 'granules: %')
SETTINGS session_timezone = 'EST';

SELECT count()
FROM `03636_data_parsed`
WHERE ts = '2025-09-02 19:00:00';

SELECT trim(`explain`)
FROM (
        EXPLAIN indexes = 1
        SELECT count()
        FROM `03636_data_parsed`
        WHERE ts = '2025-09-02 19:00:00'
    )
WHERE ilike(trim(`explain`), 'condition: %')
    OR ilike(trim(`explain`), 'parts: %')
    OR ilike(trim(`explain`), 'granules: %');

SELECT count()
FROM `03636_data_parsed`
WHERE ts = '2025-09-02 19:00:00'
SETTINGS session_timezone = 'EST';

SELECT trim(`explain`)
FROM (
        EXPLAIN indexes = 1
        SELECT count()
        FROM `03636_data_parsed`
        WHERE ts = '2025-09-02 19:00:00'
    )
WHERE ilike(trim(`explain`), 'condition: %')
    OR ilike(trim(`explain`), 'parts: %')
    OR ilike(trim(`explain`), 'granules: %')
SETTINGS session_timezone = 'EST';