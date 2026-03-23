-- MergeTree
SYSTEM DROP  TABLE IF EXISTS `01746_merge_tree`;

CREATE TABLE `01746_merge_tree`
(
    n1 Int8,
    n2 Int8,
    n3 Int8,
    n4 Int8
)
ENGINE = MergeTree
ORDER BY n1;

SYSTEM DROP  TABLE IF EXISTS `01746_merge_tree_mv`;

CREATE MATERIALIZED VIEW `01746_merge_tree_mv`
ENGINE = Memory
AS
SELECT
    n2,
    n3
FROM `01746_merge_tree`;

SYSTEM DROP  TABLE `01746_merge_tree`;

SYSTEM DROP  TABLE `01746_merge_tree_mv`;

-- Null 
SYSTEM DROP  TABLE IF EXISTS `01746_null`;

CREATE TABLE `01746_null`
(
    n1 Int8,
    n2 Int8,
    n3 Int8
)
ENGINE = Null;

SYSTEM DROP  TABLE IF EXISTS `01746_null_mv`;

CREATE MATERIALIZED VIEW `01746_null_mv`
ENGINE = Memory
AS
SELECT
    n1,
    n2
FROM `01746_null`;

SYSTEM DROP  TABLE `01746_null`;

SYSTEM DROP  TABLE `01746_null_mv`;

-- Distributed
SYSTEM DROP  TABLE IF EXISTS `01746_local`;

CREATE TABLE `01746_local`
(
    n1 Int8,
    n2 Int8,
    n3 Int8
)
ENGINE = Memory;

SYSTEM DROP  TABLE IF EXISTS `01746_dist`;

CREATE TABLE `01746_dist` AS `01746_local`
ENGINE = Distributed('test_shard_localhost', currentDatabase(), `01746_local`, rand());

SYSTEM DROP  TABLE IF EXISTS `01746_dist_mv`;

CREATE MATERIALIZED VIEW `01746_dist_mv`
ENGINE = Memory
AS
SELECT
    n1,
    n2
FROM `01746_dist`;

SYSTEM DROP  TABLE `01746_local`;

SYSTEM DROP  TABLE `01746_dist`;

SYSTEM DROP  TABLE `01746_dist_mv`;

-- Merge
SYSTEM DROP  TABLE IF EXISTS `01746_merge_t`;

CREATE TABLE `01746_merge_t`
(
    n1 Int8,
    n2 Int8,
    n3 Int8
)
ENGINE = Memory;

SYSTEM DROP  TABLE IF EXISTS `01746_merge`;

CREATE TABLE `01746_merge` AS `01746_merge_t`
ENGINE = Merge(currentDatabase(), '01746_merge_t');

SYSTEM DROP  TABLE IF EXISTS `01746_merge_mv`;

CREATE MATERIALIZED VIEW `01746_merge_mv`
ENGINE = Memory
AS
SELECT
    n1,
    n2
FROM `01746_merge`;

SYSTEM DROP  TABLE `01746_merge_t`;

SYSTEM DROP  TABLE `01746_merge`;

SYSTEM DROP  TABLE `01746_merge_mv`;

-- Buffer
SYSTEM DROP  TABLE IF EXISTS `01746_buffer_t`;

CREATE TABLE `01746_buffer_t`
(
    n1 Int8,
    n2 Int8,
    n3 Int8
)
ENGINE = Memory;

SYSTEM DROP  TABLE IF EXISTS `01746_buffer`;

CREATE TABLE `01746_buffer` AS `01746_buffer_t`
ENGINE = Buffer(currentDatabase(), `01746_buffer_t`, 16, 10, 100, 10000, 1000000, 10000000, 100000000);

SYSTEM DROP  TABLE IF EXISTS `01746_buffer_mv`;

CREATE MATERIALIZED VIEW `01746_buffer_mv`
ENGINE = Memory
AS
SELECT
    n1,
    n2
FROM `01746_buffer`;

SYSTEM DROP  TABLE `01746_buffer_t`;

SYSTEM DROP  TABLE `01746_buffer`;

SYSTEM DROP  TABLE `01746_buffer_mv`;