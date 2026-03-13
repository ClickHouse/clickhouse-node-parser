-- This won't work, see https://github.com/ClickHouse/ClickHouse/issues/89854
-- select count(), toString(json.a) from test group by toString(json.a) settings enable_analyzer=0, optimize_injective_functions_in_group_by=0;
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