-- const pattern
SELECT haystack LIKE 'pattern\\' from tab; -- { serverError CANNOT_PARSE_ESCAPE_SEQUENCE }
-- non-const pattern
SELECT haystack LIKE pattern from tab; -- { serverError CANNOT_PARSE_ESCAPE_SEQUENCE }
