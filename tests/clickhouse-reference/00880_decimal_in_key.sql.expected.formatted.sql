CREATE TABLE t1
(
    str String,
    dec Decimal64(8)
)
ENGINE = MergeTree
ORDER BY str;

CREATE TABLE t2
(
    str String,
    dec Decimal64(8)
)
ENGINE = MergeTree
ORDER BY dec;

SELECT count()
FROM t1;

SELECT count()
FROM t2;