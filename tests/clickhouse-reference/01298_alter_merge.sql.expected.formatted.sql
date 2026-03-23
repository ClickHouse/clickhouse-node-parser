SET allow_deprecated_syntax_for_merge_tree = 1;

CREATE TABLE merge1
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

INSERT INTO merge1;

CREATE TABLE merge2
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

INSERT INTO merge2;

CREATE TABLE merge
(
    CounterID UInt32,
    StartDate Date,
    Sign Int8,
    VisitID UInt64,
    UserID UInt64,
    StartTime DateTime,
    ClickLogID UInt64
)
ENGINE = Merge(currentDatabase(), 'merge\\[0-9\\]');

INSERT INTO merge1;

SELECT
    CounterID,
    dummy
FROM merge
WHERE dummy <> ''
LIMIT 10;

SELECT
    CounterID,
    dummy1
FROM merge
WHERE dummy1 <> ''
LIMIT 10;