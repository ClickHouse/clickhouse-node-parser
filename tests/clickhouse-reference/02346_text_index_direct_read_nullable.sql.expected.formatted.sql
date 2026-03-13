-- When hasAnyTokens has a nullable needle, the result type is Nullable(UInt8).
-- The text index direct read optimization should correctly handle this by wrapping the result with toNullable.
SELECT *
FROM tab
WHERE hasAnyTokens(val, toNullable('hello'));

SELECT *
FROM tab
PREWHERE hasAnyTokens(val, toNullable('hello'));

-- Test with not() which also returns Nullable(UInt8) when its argument is nullable
SELECT *
FROM tab
WHERE NOT hasAnyTokens(val, toNullable('FOO'));

SELECT *
FROM tab
PREWHERE NOT hasAnyTokens(val, toNullable('FOO'));

-- Test in a more complex expression (similar to the fuzzer query that caused the failure)
SELECT count()
FROM tab
PREWHERE and(key > 0, NOT hasAnyTokens(val, toNullable('FOO')));