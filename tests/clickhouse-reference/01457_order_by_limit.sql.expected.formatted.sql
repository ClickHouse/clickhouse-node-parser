SYSTEM drop  table if exists order_by_another;

CREATE TABLE order_by_another
(
    a Nullable(UInt64),
    b UInt64
)
ENGINE = MergeTree
ORDER BY tuple();

INSERT INTO order_by_another;

SELECT
    a,
    b
FROM order_by_another
ORDER BY
    a ASC,
    b ASC
LIMIT 4;

SELECT
    a,
    b
FROM order_by_another
ORDER BY
    a ASC,
    b ASC
LIMIT 4;

SELECT
    a,
    b
FROM order_by_another
ORDER BY
    a DESC,
    b ASC
LIMIT 4;

SELECT
    a,
    b
FROM order_by_another
ORDER BY
    a DESC,
    b ASC
LIMIT 4;

SELECT
    a,
    b
FROM order_by_another
ORDER BY
    a ASC,
    b DESC
LIMIT 4;

SELECT
    a,
    b
FROM order_by_another
ORDER BY
    a ASC,
    b DESC
LIMIT 4;

SELECT
    a,
    b
FROM order_by_another
ORDER BY
    a DESC,
    b DESC
LIMIT 4;

SELECT
    a,
    b
FROM order_by_another
ORDER BY
    a DESC,
    b DESC
LIMIT 4;