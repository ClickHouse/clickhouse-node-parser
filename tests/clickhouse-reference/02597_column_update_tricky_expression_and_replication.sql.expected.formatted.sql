-- Tags: no-shared-merge-tree
-- Tag no-shared-merge-tree - in SMT this works differently
-- Test for MergeTreeData::checkDropCommandDoesntAffectInProgressMutations() basically
SYSTEM DROP  TABLE IF EXISTS test SYNC;

CREATE TABLE test
(
    c_id String,
    p_id String,
    d UInt32
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test/test_table', '1')
ORDER BY (c_id, p_id);

INSERT INTO test SELECT
    '1',
    '11',
    '111'
FROM numbers(5);

SELECT *
FROM test
FORMAT Null;

SYSTEM DROP  TABLE test;