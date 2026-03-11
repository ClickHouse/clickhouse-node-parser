-- This should return NULL, not throw an exception
SELECT NULL::LowCardinality(Nullable(String))::text;
-- Verify the type is Nullable(String)
SELECT toTypeName(NULL::LowCardinality(Nullable(String))::text);
-- Test with non-NULL value
SELECT 'hello'::LowCardinality(Nullable(String))::text;
SELECT toTypeName('hello'::LowCardinality(Nullable(String))::text);
-- Comparison with regular Nullable (should behave the same)
SELECT NULL::Nullable(String)::text;
SELECT toTypeName(NULL::Nullable(String)::text);
