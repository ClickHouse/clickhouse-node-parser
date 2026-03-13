-- const pattern
SELECT like(haystack, 'pattern\\')
FROM tab; -- { serverError CANNOT_PARSE_ESCAPE_SEQUENCE }

-- non-const pattern
SELECT like(haystack, pattern)
FROM tab; -- { serverError CANNOT_PARSE_ESCAPE_SEQUENCE }