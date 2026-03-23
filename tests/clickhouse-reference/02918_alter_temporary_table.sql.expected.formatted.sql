DROP TABLE IF EXISTS alter_test;

CREATE TEMPORARY TABLE alter_test
(
    CounterID UInt32,
    StartDate Date,
    UserID UInt32,
    VisitID UInt32,
    NestedColumn Nested(A UInt8, S String),
    ToDrop UInt32
);

INSERT INTO alter_test;

SELECT *
FROM alter_test;

DROP TABLE alter_test;