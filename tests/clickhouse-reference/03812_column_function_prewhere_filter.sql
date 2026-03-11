-- Test case 1: ColumnFunction shares ColumnConst columns for ['12'] and ['key']
SELECT count() FROM test_column_function_filter
PREWHERE filter_val BETWEEN 20 AND 80
    AND (
        (multiSearchAny(name, ['123', '456', '789']) > 0)
        OR arrayExists(x -> arrayExists(y -> position(y, x) > 0, mapKeys(attrs)), ['12'])
        OR arrayExists(x -> arrayExists(y -> position(y, x) > 0, mapValues(attrs)), ['12'])
    )
    AND (
        arrayExists(x -> arrayExists(y -> position(y, x) > 0, mapKeys(attrs)), ['key'])
        OR arrayExists(x -> arrayExists(y -> position(y, x) > 0, mapValues(attrs)), ['key'])
    );
-- Test case 2: ColumnFunction shares a ColumnArray column for mapKeys(attrs)
SELECT count() FROM test_column_function_filter
PREWHERE filter_val BETWEEN 20 AND 80
    AND (
        (multiSearchAny(name, ['123', '456', '789']) > 0)
        OR arrayExists(x -> arrayExists(y -> position(y, x) > 0, mapKeys(attrs)), ['12'])
    )
    AND arrayExists(x -> arrayExists(y -> position(y, x) > 0, mapKeys(attrs)), ['key']);
