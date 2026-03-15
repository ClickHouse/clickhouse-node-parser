SET allow_reorder_prewhere_conditions = 0;

CREATE TABLE t1
(
    s1 String,
    s2 String,
    s3 String
)
ENGINE = MergeTree
ORDER BY tuple();

CREATE TABLE t2
(
    fs1 FixedString(10),
    fs2 FixedString(10)
)
ENGINE = MergeTree
ORDER BY tuple();