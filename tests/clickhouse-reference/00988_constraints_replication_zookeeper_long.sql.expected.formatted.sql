CREATE TABLE replicated_constraints1
(
    a UInt32,
    b UInt32,
    CONSTRAINT a_constraint CHECK a < 10
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test_00988/alter_constraints', 'r1')
ORDER BY a;

CREATE TABLE replicated_constraints2
(
    a UInt32,
    b UInt32,
    CONSTRAINT a_constraint CHECK a < 10
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test_00988/alter_constraints', 'r2')
ORDER BY a;