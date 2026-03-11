SELECT multiIf(col1 > 2, col2 / col3, 4.0)
FROM test
SETTINGS min_count_to_compile_expression = 0;