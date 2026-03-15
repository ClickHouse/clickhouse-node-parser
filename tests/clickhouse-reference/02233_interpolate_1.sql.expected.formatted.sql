CREATE TABLE t_inter_02233
(
    n Int32
)
ENGINE = MergeTree
ORDER BY n;

SELECT
    n,
    count() AS m
FROM t_inter_02233
GROUP BY n
ORDER BY n ASC WITH FILL INTERPOLATE (m AS m + 1);