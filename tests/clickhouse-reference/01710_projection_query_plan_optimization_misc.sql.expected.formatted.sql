CREATE TABLE t
(
    x Int32,
    codectest Int32
)
ENGINE = MergeTree
ORDER BY x;

INSERT INTO t;

SELECT *
FROM merge('', 't');