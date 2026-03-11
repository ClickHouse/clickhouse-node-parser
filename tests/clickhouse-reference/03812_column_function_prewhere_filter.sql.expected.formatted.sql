SELECT count()
FROM test_column_function_filter
PREWHERE and(greaterOrEquals(filter_val, 20), lessOrEquals(filter_val, 80))
    AND (((multiSearchAny(name, ['123', '456', '789']) > 0)
    OR arrayExists(x -> arrayExists(y -> position(y, x) > 0, mapKeys(attrs)), ['12'])
    OR arrayExists(x -> arrayExists(y -> position(y, x) > 0, mapValues(attrs)), ['12'])))
    AND ((arrayExists(x -> arrayExists(y -> position(y, x) > 0, mapKeys(attrs)), ['key'])
    OR arrayExists(x -> arrayExists(y -> position(y, x) > 0, mapValues(attrs)), ['key'])));

SELECT count()
FROM test_column_function_filter
PREWHERE and(greaterOrEquals(filter_val, 20), lessOrEquals(filter_val, 80))
    AND (((multiSearchAny(name, ['123', '456', '789']) > 0)
    OR arrayExists(x -> arrayExists(y -> position(y, x) > 0, mapKeys(attrs)), ['12'])))
    AND arrayExists(x -> arrayExists(y -> position(y, x) > 0, mapKeys(attrs)), ['key']);