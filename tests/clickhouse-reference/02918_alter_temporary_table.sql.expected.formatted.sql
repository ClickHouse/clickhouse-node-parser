CREATE TEMPORARY TABLE alter_test
(
    CounterID UInt32,
    StartDate Date,
    UserID UInt32,
    VisitID UInt32,
    NestedColumn Nested(A UInt8, S String),
    ToDrop UInt32
);

SELECT *
FROM alter_test;