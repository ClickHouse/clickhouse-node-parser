CREATE TABLE t
(
    c Decimal32(9)
)
ENGINE = MergeTree
ORDER BY c;

SELECT *
FROM t
WHERE c < 1.2;