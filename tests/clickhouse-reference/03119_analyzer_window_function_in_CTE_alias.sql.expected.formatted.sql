-- aliases clash without CTE
SELECT
    avg(a) OVER () AS a,
    id
FROM test
SETTINGS allow_experimental_window_functions = 1;