CREATE TABLE nested_test
(
    x UInt32,
    `nest.col1` Array(String),
    `nest.col2` Array(Int8)
)
ENGINE = MergeTree
ORDER BY x;

SELECT *
FROM nested_test;