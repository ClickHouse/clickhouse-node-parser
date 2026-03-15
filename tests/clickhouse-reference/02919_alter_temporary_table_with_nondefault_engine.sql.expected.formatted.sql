CREATE TEMPORARY TABLE alter_test
(
    a UInt32,
    b UInt8
)
ENGINE = MergeTree
ORDER BY a;

CREATE TEMPORARY TABLE alter_test
(
    a UInt32,
    b UInt8
)
ENGINE = Log;

CREATE TEMPORARY TABLE alter_test
(
    a UInt32,
    b UInt8
)
ENGINE = Null;