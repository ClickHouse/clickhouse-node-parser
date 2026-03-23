-- { echo ON }
CREATE TABLE src
(
    x UInt8
)
ENGINE = Memory;

CREATE TABLE dst
(
    x UInt8
)
ENGINE = Memory;

CREATE MATERIALIZED VIEW mv1
TO dst
AS
SELECT *
FROM src;

INSERT INTO src;

SELECT *
FROM dst;