CREATE TABLE `01746_merge_tree`
(
    n1 Int8,
    n2 Int8,
    n3 Int8,
    n4 Int8
)
ENGINE = MergeTree
ORDER BY n1;

CREATE MATERIALIZED VIEW `01746_merge_tree_mv`
ENGINE = Memory
AS
SELECT
    n2,
    n3
FROM `01746_merge_tree`;

CREATE TABLE `01746_null`
(
    n1 Int8,
    n2 Int8,
    n3 Int8
)
ENGINE = Null;

CREATE MATERIALIZED VIEW `01746_null_mv`
ENGINE = Memory
AS
SELECT
    n1,
    n2
FROM `01746_null`;

CREATE TABLE `01746_local`
(
    n1 Int8,
    n2 Int8,
    n3 Int8
)
ENGINE = Memory;

CREATE TABLE `01746_dist` AS `01746_local`
ENGINE = Distributed('test_shard_localhost', currentDatabase(), `01746_local`, rand());

CREATE MATERIALIZED VIEW `01746_dist_mv`
ENGINE = Memory
AS
SELECT
    n1,
    n2
FROM `01746_dist`;

CREATE TABLE `01746_merge_t`
(
    n1 Int8,
    n2 Int8,
    n3 Int8
)
ENGINE = Memory;

CREATE TABLE `01746_merge` AS `01746_merge_t`
ENGINE = Merge(currentDatabase(), '01746_merge_t');

CREATE MATERIALIZED VIEW `01746_merge_mv`
ENGINE = Memory
AS
SELECT
    n1,
    n2
FROM `01746_merge`;

CREATE TABLE `01746_buffer_t`
(
    n1 Int8,
    n2 Int8,
    n3 Int8
)
ENGINE = Memory;

CREATE TABLE `01746_buffer` AS `01746_buffer_t`
ENGINE = Buffer(currentDatabase(), `01746_buffer_t`, 16, 10, 100, 10000, 1000000, 10000000, 100000000);

CREATE MATERIALIZED VIEW `01746_buffer_mv`
ENGINE = Memory
AS
SELECT
    n1,
    n2
FROM `01746_buffer`;