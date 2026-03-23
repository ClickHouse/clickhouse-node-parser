SYSTEM drop  table if exists tab;

CREATE TABLE tab
(
    x UInt32,
    y UInt32
)
ENGINE = MergeTree
ORDER BY x;

INSERT INTO tab SELECT
    number,
    number
FROM numbers(10);

INSERT INTO tab SELECT
    number + 10,
    number + 10
FROM numbers(10);

SET optimize_sorting_by_input_stream_properties = 1;

SET optimize_aggregation_in_order = 1;

SET enable_memory_bound_merging_of_aggregation_results = 1;

SET prefer_localhost_replica = 1;

-- Nothing is working here :(
SELECT sum(y) AS s
FROM remote('127.0.0.{1,2}', currentDatabase(), tab)
GROUP BY x
ORDER BY x ASC;

SELECT replaceAll(trimLeft(`explain`), '__table1.', '')
FROM (
        EXPLAIN actions = 1, sorting = 1, description = 0
        SELECT sum(y) AS s
        FROM remote('127.0.0.{1,2}', currentDatabase(), tab)
        GROUP BY x
        ORDER BY x ASC
    )
WHERE ilike(`explain`, '%sort%')
    OR like(`explain`, '%ReadFromMergeTree%')
    OR like(`explain`, '%Aggregat%');

SELECT sum(y) AS s
FROM remote('127.0.0.{1,2}', currentDatabase(), tab)
GROUP BY x
ORDER BY x DESC;

SELECT replaceAll(trimLeft(`explain`), '__table1.', '')
FROM (
        EXPLAIN actions = 1, sorting = 1, description = 0
        SELECT sum(y) AS s
        FROM remote('127.0.0.{1,2}', currentDatabase(), tab)
        GROUP BY x
        ORDER BY x DESC
    )
WHERE ilike(`explain`, '%sort%')
    OR like(`explain`, '%ReadFromMergeTree%')
    OR like(`explain`, '%Aggregat%');

SELECT sum(y) AS s
FROM remote('127.0.0.{1,2}', currentDatabase(), tab)
GROUP BY x
ORDER BY
    x ASC,
    s ASC;

SELECT replaceAll(trimLeft(`explain`), '__table1.', '')
FROM (
        EXPLAIN actions = 1, sorting = 1, description = 0
        SELECT sum(y) AS s
        FROM remote('127.0.0.{1,2}', currentDatabase(), tab)
        GROUP BY x
        ORDER BY
            x ASC,
            s ASC
    )
WHERE ilike(`explain`, '%sort%')
    OR like(`explain`, '%ReadFromMergeTree%')
    OR like(`explain`, '%Aggregat%');