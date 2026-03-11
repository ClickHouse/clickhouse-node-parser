SELECT '-- Monotonic function in partition key';

SELECT count()
FROM `03269_single_monotonic`
WHERE id NOT IN (6, 38);

SELECT count()
FROM `03269_single_monotonic`
WHERE id NOT IN (
        SELECT id
        FROM `03269_filters`
    );

SELECT count()
FROM `03269_single_non_monotonic`
WHERE id NOT IN (6, 38);

SELECT count()
FROM `03269_single_non_monotonic`
WHERE id NOT IN (
        SELECT id
        FROM `03269_filters`
    );

SELECT count()
FROM `03269_multiple_part_cols`
WHERE dt NOT IN ('2020-01-01');

SELECT count()
FROM `03269_multiple_part_cols`
WHERE dt NOT IN (
        SELECT dt
        FROM `03269_filters`
        WHERE dt < '2021-01-01'
    );

SELECT count()
FROM `03269_multiple_part_cols`
WHERE id NOT IN (6, 38);

SELECT count()
FROM `03269_multiple_part_cols`
WHERE id NOT IN (
        SELECT id
        FROM `03269_filters`
    );

SELECT count()
FROM `03269_multiple_part_cols`
WHERE (id, dt) NOT IN ((6, '2020-01-01'), (38, '2021-01-01'));

SELECT count()
FROM `03269_multiple_part_cols`
WHERE (id, dt) NOT IN (
        SELECT
            id,
            dt
        FROM `03269_filters`
    );