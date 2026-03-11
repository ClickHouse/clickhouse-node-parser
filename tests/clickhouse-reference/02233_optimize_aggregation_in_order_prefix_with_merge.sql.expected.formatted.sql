SELECT
    child_key,
    parent_key,
    child_key
FROM data_02233
GROUP BY
    parent_key,
    child_key,
    child_key
ORDER BY
    child_key ASC,
    parent_key ASC
SETTINGS
    max_threads = 1,
    optimize_aggregation_in_order = 1;

SELECT
    child_key,
    parent_key,
    child_key
FROM data_02233
GROUP BY
    parent_key,
    child_key,
    child_key
WITH TOTALS
ORDER BY
    child_key ASC,
    parent_key ASC
SETTINGS
    max_threads = 1,
    optimize_aggregation_in_order = 1;