CREATE TABLE alter_test
(
    a Int32,
    b DateTime
)
ENGINE = ReplacingMergeTree(b)
ORDER BY a;