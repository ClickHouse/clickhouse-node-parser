-- These now throw errors because Variant(String, UInt64) has incompatible types
select * from test where v = 'Hello'; -- {serverError TYPE_MISMATCH}
select * from test where v = 42; -- {serverError NO_COMMON_TYPE}
select * from test where v = 42::UInt64::Variant(String, UInt64); -- {serverError NO_COMMON_TYPE}
select * from test_compat where v = 42;
select * from test_compat where v = 10;
