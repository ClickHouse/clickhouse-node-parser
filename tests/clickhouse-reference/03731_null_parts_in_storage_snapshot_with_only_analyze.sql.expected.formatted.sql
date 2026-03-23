-- Possible crash in case of mutations contains subquery, that will use
-- InterpreterSelectQuery() with only_analyze=true, which uses
-- getStorageSnapshotWithoutData(), and may crash in
-- getConditionSelectivityEstimator() since parts was nullptr
SYSTEM drop  table if exists t0;

SYSTEM drop  table if exists t1;

CREATE TABLE t0
(
    key Int
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS auto_statistics_types = '';

CREATE TABLE t1
(
    key Int
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS auto_statistics_types = '';

INSERT INTO t0;

INSERT INTO t1;