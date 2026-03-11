SELECT COUNT()
FROM (
        SELECT *
        FROM test_00974 FINAL
    )
WHERE x = 1
SETTINGS enable_optimize_predicate_expression_to_final_subquery = 0;

SELECT COUNT()
FROM (
        SELECT *
        FROM test_00974 FINAL
    )
WHERE x = 1
SETTINGS
    enable_optimize_predicate_expression_to_final_subquery = 1,
    max_rows_to_read = 2;