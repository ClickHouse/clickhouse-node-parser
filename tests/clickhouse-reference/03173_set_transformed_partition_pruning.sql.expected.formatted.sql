SELECT '-- Single partition by function';

SELECT count()
FROM `03173_single_function`
WHERE dt IN ('2024-01-20', '2024-05-25')
SETTINGS log_comment = '03173_single_function';

SELECT ProfileEvents['SelectedParts']
FROM `system`.query_log
WHERE type = 'QueryFinish'
    AND current_database = currentDatabase()
    AND log_comment = '03173_single_function';

SELECT count()
FROM `03173_nested_function`
WHERE id IN (10)
SETTINGS log_comment = '03173_nested_function';

SELECT count()
FROM `03173_nested_function`
WHERE xxHash32(id) IN (2158931063, 1449383981)
SETTINGS log_comment = '03173_nested_function_subexpr';

SELECT ProfileEvents['SelectedParts']
FROM `system`.query_log
WHERE type = 'QueryFinish'
    AND current_database = currentDatabase()
    AND log_comment = '03173_nested_function';

SELECT ProfileEvents['SelectedParts']
FROM `system`.query_log
WHERE type = 'QueryFinish'
    AND current_database = currentDatabase()
    AND log_comment = '03173_nested_function_subexpr';

SELECT count()
FROM `03173_nested_function_lc`
WHERE id IN (10)
SETTINGS log_comment = '03173_nested_function_lc';

SELECT count()
FROM `03173_nested_function_lc`
WHERE xxHash32(id) IN (2158931063, 1449383981)
SETTINGS log_comment = '03173_nested_function_subexpr_lc';

SELECT ProfileEvents['SelectedParts']
FROM `system`.query_log
WHERE type = 'QueryFinish'
    AND current_database = currentDatabase()
    AND log_comment = '03173_nested_function_lc';

SELECT ProfileEvents['SelectedParts']
FROM `system`.query_log
WHERE type = 'QueryFinish'
    AND current_database = currentDatabase()
    AND log_comment = '03173_nested_function_subexpr_lc';

SELECT count()
FROM `03173_nested_function_null`
WHERE id IN (10)
SETTINGS log_comment = '03173_nested_function_null';

SELECT count()
FROM `03173_nested_function_null`
WHERE xxHash32(id) IN (2158931063, 1449383981)
SETTINGS log_comment = '03173_nested_function_subexpr_null';

SELECT ProfileEvents['SelectedParts']
FROM `system`.query_log
WHERE type = 'QueryFinish'
    AND current_database = currentDatabase()
    AND log_comment = '03173_nested_function_null';

SELECT ProfileEvents['SelectedParts']
FROM `system`.query_log
WHERE type = 'QueryFinish'
    AND current_database = currentDatabase()
    AND log_comment = '03173_nested_function_subexpr_null';

SELECT count()
FROM `03173_nested_function_lc_null`
WHERE id IN (10)
SETTINGS log_comment = '03173_nested_function_lc_null';

SELECT count()
FROM `03173_nested_function_lc_null`
WHERE xxHash32(id) IN (2158931063, 1449383981)
SETTINGS log_comment = '03173_nested_function_subexpr_lc_null';

SELECT ProfileEvents['SelectedParts']
FROM `system`.query_log
WHERE type = 'QueryFinish'
    AND current_database = currentDatabase()
    AND log_comment = '03173_nested_function_lc_null';

SELECT ProfileEvents['SelectedParts']
FROM `system`.query_log
WHERE type = 'QueryFinish'
    AND current_database = currentDatabase()
    AND log_comment = '03173_nested_function_subexpr_lc_null';

SELECT count()
FROM `03173_nonsafe_cast`
WHERE id IN (
        SELECT '50'
        UNION ALL
        SELECT '99'
    )
SETTINGS log_comment = '03173_nonsafe_cast';

SELECT ProfileEvents['SelectedParts']
FROM `system`.query_log
WHERE type = 'QueryFinish'
    AND current_database = currentDatabase()
    AND log_comment = '03173_nonsafe_cast';

SELECT count()
FROM `03173_multiple_partition_cols`
WHERE key2 IN (4)
SETTINGS log_comment = '03173_multiple_columns';

SELECT count()
FROM `03173_multiple_partition_cols`
WHERE xxHash32(key2) IN (4251411170)
SETTINGS log_comment = '03173_multiple_columns_subexpr';

SELECT ProfileEvents['SelectedParts']
FROM `system`.query_log
WHERE type = 'QueryFinish'
    AND current_database = currentDatabase()
    AND log_comment = '03173_multiple_columns';

SELECT ProfileEvents['SelectedParts']
FROM `system`.query_log
WHERE type = 'QueryFinish'
    AND current_database = currentDatabase()
    AND log_comment = '03173_multiple_columns_subexpr';

SELECT count()
FROM `03173_base_data_source`
WHERE id IN (
        SELECT id
        FROM `03173_low_cardinality_set`
    )
SETTINGS log_comment = '03173_low_cardinality_set';

SELECT ProfileEvents['SelectedParts']
FROM `system`.query_log
WHERE type = 'QueryFinish'
    AND current_database = currentDatabase()
    AND log_comment = '03173_low_cardinality_set';

SELECT count()
FROM `03173_base_data_source`
WHERE id IN (
        SELECT id
        FROM `03173_nullable_set`
    )
SETTINGS log_comment = '03173_nullable_set';

SELECT ProfileEvents['SelectedParts']
FROM `system`.query_log
WHERE type = 'QueryFinish'
    AND current_database = currentDatabase()
    AND log_comment = '03173_nullable_set';

SELECT count()
FROM `03173_base_data_source`
WHERE id IN (
        SELECT id
        FROM `03173_lc_nullable_set`
    )
SETTINGS log_comment = '03173_lc_nullable_set';

SELECT ProfileEvents['SelectedParts']
FROM `system`.query_log
WHERE type = 'QueryFinish'
    AND current_database = currentDatabase()
    AND log_comment = '03173_lc_nullable_set';

SELECT count()
FROM `03173_date_parsing`
WHERE id IN ('2023-04-02', '2023-05-02');

SELECT count()
FROM `03173_date_parsing`
WHERE id IN ('not a date');

SELECT count()
FROM `03173_nested_date_parsing`
WHERE id IN ('2000-01-21', '2023-05-02')
SETTINGS
    log_comment = '03173_nested_date_parsing',
    session_timezone = '';

SELECT ProfileEvents['SelectedParts']
FROM `system`.query_log
WHERE type = 'QueryFinish'
    AND current_database = currentDatabase()
    AND log_comment = '03173_nested_date_parsing';

SELECT count()
FROM `03173_nested_date_parsing`
WHERE id IN ('not a date');

SELECT id
FROM `03173_empty_transform`
WHERE xxHash32(id) % 3 IN (xxHash32(2::Int32) % 3)
SETTINGS log_comment = '03173_empty_transform';

SELECT ProfileEvents['SelectedParts']
FROM `system`.query_log
WHERE type = 'QueryFinish'
    AND current_database = currentDatabase()
    AND log_comment = '03173_empty_transform';