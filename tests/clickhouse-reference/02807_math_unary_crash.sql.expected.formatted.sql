CREATE TABLE t10
(
    c0 Int32
)
ENGINE = MergeTree
ORDER BY tuple();

SELECT 1
FROM t10
GROUP BY erf(negate(sign(t10.c0)));

SELECT 1
FROM t10
GROUP BY negate(sign(t10.c0));