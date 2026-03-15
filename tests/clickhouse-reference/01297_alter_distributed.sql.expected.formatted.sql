SET allow_deprecated_syntax_for_merge_tree = 1;

CREATE TABLE merge_distributed1
(
    CounterID UInt32,
    StartDate Date,
    Sign Int8,
    VisitID UInt64,
    UserID UInt64,
    StartTime DateTime,
    ClickLogID UInt64
)
ENGINE = CollapsingMergeTree(StartDate, intHash32(UserID), tuple(CounterID, StartDate, intHash32(UserID), VisitID, ClickLogID), 8192, Sign);

CREATE TABLE merge_distributed
(
    CounterID UInt32,
    StartDate Date,
    Sign Int8,
    VisitID UInt64,
    UserID UInt64,
    StartTime DateTime,
    ClickLogID UInt64
)
ENGINE = Distributed(test_shard_localhost, currentDatabase(), merge_distributed1);

SELECT
    CounterID,
    dummy
FROM merge_distributed
WHERE dummy <> ''
LIMIT 10;

SELECT
    CounterID,
    dummy1
FROM merge_distributed
WHERE dummy1 <> ''
LIMIT 10; -- { serverError UNKNOWN_IDENTIFIER }