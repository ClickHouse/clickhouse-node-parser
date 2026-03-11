-- Test normal COLUMNS() ARRAY JOIN (should work)
SELECT x, arr1, arr2 FROM t1 ARRAY JOIN COLUMNS('arr.*') ORDER BY arr1, arr2;
-- Test COLUMNS() matching no columns (should fail)
SELECT * FROM t1 ARRAY JOIN COLUMNS('nonexistent'); -- { serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH }
