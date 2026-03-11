SELECT count()
FROM test_table
WHERE value = '1'
SETTINGS force_data_skipping_indices = 'value_idx';

SELECT count()
FROM
    test_table AS t1
INNER JOIN (
        SELECT number AS id
        FROM numbers(10)
    ) AS t2
    ON t1.id = t2.id
WHERE t1.value = '1'
SETTINGS force_data_skipping_indices = 'value_idx';