SET allow_deprecated_syntax_for_merge_tree = 1;

CREATE TABLE alter_test
(
    CounterID UInt32,
    StartDate Date,
    UserID UInt32,
    VisitID UInt32,
    NestedColumn Nested(A UInt8, S String),
    ToDrop UInt32
)
ENGINE = MergeTree(StartDate, intHash32(UserID), (CounterID, StartDate, intHash32(UserID), VisitID), 8192);

SELECT *
FROM alter_test;