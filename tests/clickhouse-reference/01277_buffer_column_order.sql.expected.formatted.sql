CREATE TABLE out_01277
(
    k1 Int,
    k2 Int,
    a1 Int,
    a2 Int,
    b1 Int,
    b2 Int,
    c Int
)
ENGINE = Null();

CREATE TABLE buffer_01277 AS out_01277
ENGINE = Buffer(currentDatabase(), out_01277, 1, 86400, 86400, 1e5, 1e6, 10e6, 100e6);

CREATE TABLE in_01277 AS out_01277
ENGINE = Null();

-- differs in order of fields in SELECT clause
CREATE MATERIALIZED VIEW mv_01277_1
TO buffer_01277
AS
SELECT
    k1,
    k2,
    a1,
    a2,
    b1,
    b2,
    c
FROM in_01277;

CREATE MATERIALIZED VIEW mv_01277_2
TO buffer_01277
AS
SELECT
    a1,
    a2,
    k1,
    k2,
    b1,
    b2,
    c
FROM in_01277;