SELECT (assumeNotNull((NULL)), 1); -- { serverError ILLEGAL_COLUMN }
SELECT (assumeNotNull(materialize(NULL)), 1); -- { serverError ILLEGAL_COLUMN }
SELECT 1 WHERE (assumeNotNull(NULL), 1) = (1, 1); -- { serverError ILLEGAL_COLUMN }
SELECT 1 WHERE (assumeNotNull(materialize(NULL)), 1) = (1, 1); -- { serverError ILLEGAL_TYPE_OF_COLUMN_FOR_FILTER }
