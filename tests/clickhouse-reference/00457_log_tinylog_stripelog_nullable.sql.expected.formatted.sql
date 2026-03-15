CREATE TABLE nullable_00457
(
    s String,
    ns Nullable(String),
    narr Array(Nullable(UInt64))
)
ENGINE = Log;

SELECT *
FROM nullable_00457
ORDER BY s ASC;

SELECT s
FROM nullable_00457
ORDER BY s ASC;

SELECT ns
FROM nullable_00457
ORDER BY s ASC;

SELECT narr
FROM nullable_00457
ORDER BY s ASC;

SELECT
    s,
    narr
FROM nullable_00457
ORDER BY s ASC;

CREATE TABLE nullable_00457
(
    s String,
    ns Nullable(String),
    narr Array(Nullable(UInt64))
)
ENGINE = TinyLog;

CREATE TABLE nullable_00457
(
    s String,
    ns Nullable(String),
    narr Array(Nullable(UInt64))
)
ENGINE = StripeLog;