-- Tags: no-parallel-replicas
-- Variant with incompatible types now throws on comparison (strict behavior)

set allow_experimental_variant_type=1;
set allow_suspicious_variant_types=1;
create table test (v Variant(String, UInt64)) engine=MergeTree ORDER BY tuple();
-- These now throw errors because Variant(String, UInt64) has incompatible types
select * from test where v = 'Hello'; -- {serverError TYPE_MISMATCH}
select * from test where v = 42; -- {serverError NO_COMMON_TYPE}
select * from test where v = 42::UInt64::Variant(String, UInt64); -- {serverError NO_COMMON_TYPE}
-- Test with compatible types works fine
create table test_compat (v Variant(UInt64, UInt32)) engine=MergeTree ORDER BY tuple();
select * from test_compat where v = 42;
select * from test_compat where v = 10;
