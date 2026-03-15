SELECT 1;

SELECT nonexistent AS column; -- { serverError UNKNOWN_IDENTIFIER }