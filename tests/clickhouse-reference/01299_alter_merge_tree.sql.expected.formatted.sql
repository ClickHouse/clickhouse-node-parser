DROP TABLE IF EXISTS merge_tree;

SET allow_deprecated_syntax_for_merge_tree = 1;

CREATE TABLE merge_tree
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

INSERT INTO merge_tree;

INSERT INTO merge_tree;

SELECT
    CounterID,
    dummy
FROM merge_tree
WHERE dummy <> ''
LIMIT 10;

DROP TABLE merge_tree;