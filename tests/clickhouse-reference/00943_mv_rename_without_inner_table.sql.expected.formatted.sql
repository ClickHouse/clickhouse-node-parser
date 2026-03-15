CREATE TABLE src
(
    x UInt8
)
ENGINE = Null;

CREATE TABLE dst
(
    x UInt8
)
ENGINE = Memory;

CREATE MATERIALIZED VIEW original_mv
TO dst
AS
SELECT *
FROM src;

SELECT *
FROM original_mv
ORDER BY x ASC;

SELECT *
FROM dst
ORDER BY x ASC;

SELECT *
FROM new_mv
ORDER BY x ASC;