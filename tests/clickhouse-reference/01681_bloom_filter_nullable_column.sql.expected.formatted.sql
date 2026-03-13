SELECT *
FROM bloom_filter_nullable_index
WHERE str IN (
        SELECT
            '1048576',
            str
        FROM bloom_filter_nullable_index
    )
SETTINGS transform_null_in = 0;

SELECT *
FROM bloom_filter_nullable_index
WHERE str IN (
        SELECT
            '1048576',
            str
        FROM bloom_filter_nullable_index
    )
SETTINGS transform_null_in = 1; -- { serverError NUMBER_OF_COLUMNS_DOESNT_MATCH }

SELECT *
FROM bloom_filter_nullable_index
WHERE str IN (
        SELECT cast('test', 'Nullable(String)')
    )
SETTINGS transform_null_in = 0;

SELECT *
FROM bloom_filter_nullable_index
WHERE str IN (
        SELECT cast('test', 'Nullable(String)')
    )
SETTINGS transform_null_in = 1;

SELECT *
FROM bloom_filter_nullable_index
WHERE str IN (
        SELECT value
        FROM nullable_string_value
    )
SETTINGS transform_null_in = 0;

SELECT *
FROM bloom_filter_nullable_index
WHERE str IN (
        SELECT value
        FROM nullable_string_value
    )
SETTINGS transform_null_in = 1;