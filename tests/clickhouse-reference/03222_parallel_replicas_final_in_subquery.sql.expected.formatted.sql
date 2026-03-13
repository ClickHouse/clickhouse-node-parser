SELECT *
FROM (
        SELECT *
        FROM test_00808 FINAL
    )
WHERE id = 1; -- { serverError SUPPORT_IS_DISABLED }