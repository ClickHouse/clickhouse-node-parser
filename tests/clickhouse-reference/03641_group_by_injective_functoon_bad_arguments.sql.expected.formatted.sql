SELECT
    count(),
    toString(json.a)
FROM test
GROUP BY toString(json.a)
SETTINGS
    enable_analyzer = 1,
    optimize_injective_functions_in_group_by = 0;

SELECT
    count(),
    toString(json.a)
FROM test
GROUP BY toString(json.a)
SETTINGS
    enable_analyzer = 1,
    optimize_injective_functions_in_group_by = 1;