CREATE TABLE dst
(
    `key` Int64,
    `value` String
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS non_replicated_deduplication_window=1000;
CREATE TABLE mv_dst
(
    `key` Int64,
    `value` String
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS non_replicated_deduplication_window=1000;
CREATE MATERIALIZED VIEW mv_first
TO mv_dst
AS SELECT
    0 AS key,
    value AS value
FROM dst;
CREATE MATERIALIZED VIEW mv_second
TO mv_dst
AS SELECT
    0 AS key,
    value AS value
FROM dst;
SET deduplicate_blocks_in_dependent_materialized_views=1;
INSERT INTO dst VALUES (1, 'A');
SELECT
    'from dst',
    *,
    _part
FROM dst
ORDER by all;
SELECT
    'from mv_dst',
    *,
    _part
FROM mv_dst
ORDER by all;
CREATE MATERIALIZED VIEW mv_dst
(
    `key` Int64,
    `value` String
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS non_replicated_deduplication_window=1000
AS SELECT
    0 AS key,
    value AS value
FROM dst;
INSERT INTO dst VALUES (2, 'A');
SET max_block_size=1;
SET min_insert_block_size_rows=0;
SET min_insert_block_size_bytes=0;
INSERT INTO dst SELECT
    0 AS key,
    'A' AS value
FROM numbers(2) ORDER BY ALL
SETTINGS insert_deduplication_token='some_user_token';
INSERT INTO dst SELECT
    1 AS key,
    'b' AS value
FROM numbers(2) ORDER BY ALL
SETTINGS insert_deduplication_token='some_user_token';
INSERT INTO dst SELECT
    0 AS key,
    'A' AS value
FROM numbers(2) ORDER BY ALL;
INSERT INTO dst SELECT
    number + 1 AS key,
    IF(key = 0, 'A', 'B') AS value
FROM numbers(2) ORDER BY ALL;
