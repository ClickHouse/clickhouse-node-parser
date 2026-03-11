SELECT count()
FROM test_table
WHERE id = 1
SETTINGS force_primary_key = 1;

SELECT count()
FROM test_table
WHERE value_1 = '1'
SETTINGS force_data_skipping_indices = 'value_1_idx';

SELECT count()
FROM test_table
WHERE id = 1
    AND value_1 = '1'
SETTINGS
    force_primary_key = 1,
    force_data_skipping_indices = 'value_1_idx';

SELECT count()
FROM test_table
WHERE value_2 = '1'
SETTINGS force_data_skipping_indices = 'value_2_idx';

SELECT count()
FROM test_table
WHERE value_1 = '1'
    AND value_2 = '1'
SETTINGS force_data_skipping_indices = 'value_1_idx, value_2_idx';

SELECT count()
FROM test_table
WHERE id = 1
    AND value_1 = '1'
    AND value_2 = '1'
SETTINGS
    force_primary_key = 1,
    force_data_skipping_indices = 'value_1_idx, value_2_idx';

SELECT count()
FROM test_table
WHERE value_3 = '1'
SETTINGS force_data_skipping_indices = 'value_3_idx';

SELECT count()
FROM test_table
WHERE id = 1
    AND value_3 = '1'
SETTINGS
    force_primary_key = 1,
    force_data_skipping_indices = 'value_3_idx';

SELECT count()
FROM test_table
WHERE id = 1
    AND value_1 = '1'
    AND value_2 = '1'
    AND value_3 = '1'
SETTINGS
    force_primary_key = 1,
    force_data_skipping_indices = 'value_1_idx, value_2_idx, value_3_idx';

SELECT count()
FROM
    test_table AS t1
INNER JOIN (
        SELECT number AS id
        FROM numbers(10)
    ) AS t2
    ON t1.id = t2.id
WHERE t1.id = 1
SETTINGS force_primary_key = 1;

SELECT count()
FROM
    test_table AS t1
INNER JOIN (
        SELECT number AS id
        FROM numbers(10)
    ) AS t2
    ON t1.id = t2.id
WHERE t1.value_1 = '1'
SETTINGS force_data_skipping_indices = 'value_1_idx';

SELECT count()
FROM
    test_table AS t1
INNER JOIN (
        SELECT number AS id
        FROM numbers(10)
    ) AS t2
    ON t1.id = t2.id
WHERE t1.id = 1
    AND t1.value_1 = '1'
SETTINGS
    force_primary_key = 1,
    force_data_skipping_indices = 'value_1_idx';

SELECT count()
FROM
    test_table AS t1
INNER JOIN (
        SELECT number AS id
        FROM numbers(10)
    ) AS t2
    ON t1.id = t2.id
WHERE t1.value_2 = '1'
SETTINGS force_data_skipping_indices = 'value_2_idx';

SELECT count()
FROM
    test_table AS t1
INNER JOIN (
        SELECT number AS id
        FROM numbers(10)
    ) AS t2
    ON t1.id = t2.id
WHERE t1.value_1 = '1'
    AND t1.value_2 = '1'
SETTINGS force_data_skipping_indices = 'value_1_idx, value_2_idx';

SELECT count()
FROM
    test_table AS t1
INNER JOIN (
        SELECT number AS id
        FROM numbers(10)
    ) AS t2
    ON t1.id = t2.id
WHERE t1.id = 1
    AND t1.value_1 = '1'
    AND t1.value_2 = '1'
SETTINGS
    force_primary_key = 1,
    force_data_skipping_indices = 'value_1_idx, value_2_idx';

SELECT count()
FROM
    test_table AS t1
INNER JOIN (
        SELECT number AS id
        FROM numbers(10)
    ) AS t2
    ON t1.id = t2.id
WHERE t1.value_3 = '1'
SETTINGS force_data_skipping_indices = 'value_3_idx';

SELECT count()
FROM
    test_table AS t1
INNER JOIN (
        SELECT number AS id
        FROM numbers(10)
    ) AS t2
    ON t1.id = t2.id
WHERE t1.id = 1
    AND t1.value_1 = '1'
    AND t1.value_2 = '1'
    AND t1.value_3 = '1'
SETTINGS
    force_primary_key = 1,
    force_data_skipping_indices = 'value_1_idx, value_2_idx, value_3_idx';