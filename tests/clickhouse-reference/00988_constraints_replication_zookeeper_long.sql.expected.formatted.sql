CREATE TABLE replicated_constraints1
(
    a UInt32,
    b UInt32,
    CONSTRAINT a_constraint CHECK a < 10
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test_00988/alter_constraints', 'r1')
ORDER BY (a);

CREATE TABLE replicated_constraints2
(
    a UInt32,
    b UInt32,
    CONSTRAINT a_constraint CHECK a < 10
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test_00988/alter_constraints', 'r2')
ORDER BY (a);

INSERT INTO replicated_constraints1;

INSERT INTO replicated_constraints2;

INSERT INTO replicated_constraints1; -- { serverError VIOLATED_CONSTRAINT }

INSERT INTO replicated_constraints2;

INSERT INTO replicated_constraints1; -- { serverError VIOLATED_CONSTRAINT }

INSERT INTO replicated_constraints2; -- { serverError VIOLATED_CONSTRAINT }