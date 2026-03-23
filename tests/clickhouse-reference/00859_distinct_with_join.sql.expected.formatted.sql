SYSTEM drop  table if exists fooL;

SYSTEM drop  table if exists fooR;

CREATE TABLE fooL
(
    a Int32,
    v String
)
ENGINE = Memory;

CREATE TABLE fooR
(
    a Int32,
    v String
)
ENGINE = Memory;

INSERT INTO fooL SELECT
    number,
    concat('L', toString(number))
FROM numbers(2);

INSERT INTO fooL SELECT
    number,
    concat('LL', toString(number))
FROM numbers(2);

INSERT INTO fooR SELECT
    number,
    concat('R', toString(number))
FROM numbers(2);

SELECT DISTINCT a
FROM
    fooL
LEFT JOIN fooR
    USING (a)
ORDER BY a ASC;

SYSTEM drop  table fooL;

SYSTEM drop  table fooR;