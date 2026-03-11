SELECT
    child_key,
    parent_key,
    child_key
FROM data_02233
GROUP BY
    parent_key,
    child_key,
    child_key
ORDER BY parent_key ASC
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
ORDER BY parent_key ASC
SETTINGS
    max_threads = 1,
    optimize_aggregation_in_order = 1;

SELECT
    parent_key,
    child_key,
    count()
FROM data_02233
GROUP BY
    parent_key,
    child_key
WITH TOTALS
ORDER BY
    parent_key ASC,
    child_key ASC
SETTINGS
    max_threads = 1,
    optimize_aggregation_in_order = 1;

SELECT
    parent_key,
    child_key,
    count()
FROM data_02233
GROUP BY
    parent_key,
    child_key
WITH TOTALS
ORDER BY
    parent_key ASC,
    child_key ASC
SETTINGS
    max_threads = 1,
    optimize_aggregation_in_order = 1,
    max_block_size = 1;

SELECT
    parent_key,
    child_key,
    count()
FROM data_02233
GROUP BY
    parent_key,
    child_key
WITH TOTALS
ORDER BY
    parent_key ASC,
    child_key ASC
SETTINGS
    max_threads = 1,
    optimize_aggregation_in_order = 0;

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