SYSTEM drop  table if exists data_02233;

CREATE TABLE data_02233
(
    `partition` Int,
    parent_key Int,
    child_key Int,
    value Int
)
ENGINE = MergeTree()
ORDER BY parent_key
PARTITION BY `partition`;

INSERT INTO data_02233;

INSERT INTO data_02233;

-- fuzzer
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

SYSTEM drop  table data_02233;