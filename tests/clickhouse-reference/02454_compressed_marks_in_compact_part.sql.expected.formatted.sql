CREATE TABLE cc
(
    a UInt64,
    b String
)
ENGINE = MergeTree
ORDER BY (a, b)
SETTINGS compress_marks = true;

SELECT *
FROM cc;