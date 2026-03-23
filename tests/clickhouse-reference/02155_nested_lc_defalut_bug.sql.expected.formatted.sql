SYSTEM DROP  TABLE IF EXISTS nested_test;

CREATE TABLE nested_test
(
    x UInt32,
    `nest.col1` Array(String),
    `nest.col2` Array(Int8)
)
ENGINE = MergeTree
ORDER BY x;

INSERT INTO nested_test (x, `nest.col1`, `nest.col2`);

SELECT *
FROM nested_test;