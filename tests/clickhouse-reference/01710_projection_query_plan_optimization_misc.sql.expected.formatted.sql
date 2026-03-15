CREATE TABLE t
(
    x Int32,
    codectest Int32
)
ENGINE = MergeTree
ORDER BY x;

SELECT *
FROM merge('', 't');