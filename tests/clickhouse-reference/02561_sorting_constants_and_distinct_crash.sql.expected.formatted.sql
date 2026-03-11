SELECT DISTINCT
    'constant_1' AS constant_value,
    count(*) OVER (PARTITION BY constant_value, string_value) AS value_cnt
FROM (
        SELECT string_value
        FROM test_table
    )
ORDER BY `all` ASC;

SELECT DISTINCT
    'constant_1' AS constant_value,
    *
FROM (
        SELECT string_value
        FROM test_table
    )
ORDER BY
    constant_value ASC,
    string_value ASC
SETTINGS max_threads = 1;