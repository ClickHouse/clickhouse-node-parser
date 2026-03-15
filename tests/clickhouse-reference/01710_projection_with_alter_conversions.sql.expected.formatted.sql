CREATE TABLE t
(
    i int,
    j int,
    PROJECTION p (    SELECT i
    ORDER BY i ASC)
)
ENGINE = MergeTree
ORDER BY tuple();

SET alter_sync = 0;

SELECT *
FROM t;