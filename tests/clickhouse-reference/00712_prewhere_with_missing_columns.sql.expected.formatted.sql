SYSTEM DROP  TABLE IF EXISTS mergetree_00712;

CREATE TABLE mergetree_00712
(
    x UInt8,
    s String
)
ENGINE = MergeTree
ORDER BY tuple();

INSERT INTO mergetree_00712;

SELECT *
FROM mergetree_00712;

INSERT INTO mergetree_00712;

SELECT *
FROM mergetree_00712
ORDER BY x ASC;

SELECT s
FROM mergetree_00712
PREWHERE x
    AND y
ORDER BY s ASC;

SELECT
    s,
    y
FROM mergetree_00712
PREWHERE x
    AND y
ORDER BY s ASC;

SYSTEM DROP  TABLE mergetree_00712;