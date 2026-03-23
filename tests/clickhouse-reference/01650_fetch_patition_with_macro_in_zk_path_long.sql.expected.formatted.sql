-- Tags: long, no-shared-merge-tree
DROP TABLE IF EXISTS test_01640;

DROP TABLE IF EXISTS restore_01640;

CREATE TABLE test_01640
(
    i Int64,
    d Date,
    s String
)
ENGINE = ReplicatedMergeTree('/clickhouse/{database}/{shard}/tables/test_01640', '{replica}')
ORDER BY i
PARTITION BY toYYYYMM(d);

INSERT INTO test_01640;

CREATE TABLE restore_01640
(
    i Int64,
    d Date,
    s String
)
ENGINE = ReplicatedMergeTree('/clickhouse/{database}/{shard}/tables/restore_01640', '{replica}')
ORDER BY i
PARTITION BY toYYYYMM(d);

SELECT partition_id
FROM `system`.detached_parts
WHERE (table = 'restore_01640')
    AND (database = currentDatabase());

SELECT
    _part,
    *
FROM restore_01640;

DROP TABLE test_01640;

DROP TABLE restore_01640;