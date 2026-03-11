SELECT * FROM 03591_test;
SELECT * FROM 03591_test WHERE throwIf(b=1, 'Should throw') SETTINGS optimize_move_to_prewhere = 1; -- {serverError FUNCTION_THROW_IF_VALUE_IS_NON_ZERO}
SELECT * FROM 03591_test WHERE throwIf(b=1, 'Should not throw because b=1 is not visible to this user due to the b=2 row policy') SETTINGS optimize_move_to_prewhere = 1;
SELECT * FROM 03591_test WHERE throwIf(b=2, 'Should throw') SETTINGS optimize_move_to_prewhere = 1; -- {serverError FUNCTION_THROW_IF_VALUE_IS_NON_ZERO}
