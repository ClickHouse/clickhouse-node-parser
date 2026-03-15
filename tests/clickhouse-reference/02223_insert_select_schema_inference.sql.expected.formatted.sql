CREATE TABLE test
(
    x UInt32,
    y String,
    d Date
)
ENGINE = Memory() AS
SELECT
    number AS x,
    toString(number) AS y,
    toDate(number) AS d
FROM numbers(10);

SELECT *
FROM file('data.native.zst');