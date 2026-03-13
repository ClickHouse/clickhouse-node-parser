SELECT count()
FROM test
WHERE toUInt64(val) = -1; -- { serverError CANNOT_CONVERT_TYPE }