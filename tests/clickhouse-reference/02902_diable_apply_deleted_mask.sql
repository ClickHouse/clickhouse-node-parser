SELECT *, _row_exists FROM test_apply_deleted_mask;
SELECT *, _row_exists FROM test_apply_deleted_mask SETTINGS apply_deleted_mask = 0;
SELECT * FROM test_apply_deleted_mask WHERE _row_exists SETTINGS apply_deleted_mask = 0;
