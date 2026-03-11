SELECT (NOT divideOrNull(0, *))
    AND (NOT intDivOrNull(*, 1))
SETTINGS
    compile_expressions = 1,
    min_count_to_compile_expression = 0;