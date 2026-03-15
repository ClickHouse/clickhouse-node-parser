-- {echoOn}

SET use_query_condition_cache = 0;
SET enable_parallel_replicas = 0;
SET use_statistics = 0;
CREATE TABLE 03591_test (a Int32, b Int32) ENGINE=MergeTree ORDER BY tuple();
SELECT * FROM 03591_test;
SELECT * FROM 03591_test WHERE throwIf(b=1, 'Should throw') SETTINGS optimize_move_to_prewhere = 1; -- {serverError FUNCTION_THROW_IF_VALUE_IS_NON_ZERO}
CREATE ROW POLICY 03591_rp ON 03591_test USING b=2 TO CURRENT_USER;
SELECT * FROM 03591_test WHERE throwIf(b=1, 'Should not throw because b=1 is not visible to this user due to the b=2 row policy') SETTINGS optimize_move_to_prewhere = 1;
SELECT * FROM 03591_test WHERE throwIf(b=2, 'Should throw') SETTINGS optimize_move_to_prewhere = 1; -- {serverError FUNCTION_THROW_IF_VALUE_IS_NON_ZERO}
