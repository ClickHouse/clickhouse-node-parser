-- Tags: no-shared-merge-tree
-- Tag no-shared-merge-tree - in SMT this works differently

-- Test for MergeTreeData::checkDropCommandDoesntAffectInProgressMutations() basically

CREATE TABLE test (
    `c_id` String,
    `p_id` String,
    `d` String
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test/test_table', '1')
ORDER BY (c_id, p_id);
INSERT INTO test SELECT '1', '11', '111' FROM numbers(3);
INSERT INTO test SELECT '2', '22', '22' FROM numbers(3);
set mutations_sync=0;
select * from test format Null;
