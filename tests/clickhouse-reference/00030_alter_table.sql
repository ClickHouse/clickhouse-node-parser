DROP TABLE IF EXISTS alter_test;
set allow_deprecated_syntax_for_merge_tree=1;
CREATE TABLE alter_test (CounterID UInt32, StartDate Date, UserID UInt32, VisitID UInt32, NestedColumn Nested(A UInt8, S String), ToDrop UInt32) ENGINE = MergeTree(StartDate, intHash32(UserID), (CounterID, StartDate, intHash32(UserID), VisitID), 8192);
INSERT INTO alter_test VALUES (1, '2014-01-01', 2, 3, [1,2,3], ['a','b','c'], 4);
SELECT * FROM alter_test;
DROP TABLE alter_test;
