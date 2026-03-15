CREATE TABLE bad_arrays
(
    a Array(String),
    b Array(UInt8)
)
ENGINE = Memory;

SELECT a
FROM
    bad_arrays
ARRAY JOIN b;

CREATE TABLE bad_arrays
(
    a Array(String),
    b Array(String)
)
ENGINE = Memory;

SELECT
    a,
    b
FROM
    bad_arrays
ARRAY JOIN b;