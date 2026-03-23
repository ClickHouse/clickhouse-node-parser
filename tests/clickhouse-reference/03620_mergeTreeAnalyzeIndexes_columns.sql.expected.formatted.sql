-- Tags: no-random-merge-tree-settings
-- - no-random-merge-tree-settings -- may change amount of granulas
SYSTEM drop  table if exists data;

CREATE TABLE data
(
    key Int,
    value Int
)
ENGINE = MergeTree()
ORDER BY key;

INSERT INTO data SELECT
    *,
    * + 1000000
FROM numbers(100000);

INSERT INTO data SELECT
    *,
    * + 1000000
FROM numbers(100000, 200000);

-- { echo }
SELECT part_name
FROM mergeTreeAnalyzeIndexes(currentDatabase(), data, key >= 1000);

SELECT ranges
FROM mergeTreeAnalyzeIndexes(currentDatabase(), data, key >= 1000);

SELECT arraySum(arrayMap(e -> ((e.2) - (e.1)), ranges)) AS ranges_size
FROM mergeTreeAnalyzeIndexes(currentDatabase(), data, key >= 1000);

SELECT sum(arraySum(arrayMap(e -> ((e.2) - (e.1)), ranges))) AS ranges_size
FROM mergeTreeAnalyzeIndexes(currentDatabase(), data, key >= 1000);