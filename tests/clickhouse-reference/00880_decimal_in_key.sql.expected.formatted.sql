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

INSERT INTO t1 SELECT
    toString(number),
    toDecimal64(number, 8)
FROM `system`.numbers
LIMIT 1000000;

SELECT count()
FROM t1;

INSERT INTO t2 SELECT
    toString(number),
    toDecimal64(number, 8)
FROM `system`.numbers
LIMIT 1000000;

SELECT count()
FROM t2;