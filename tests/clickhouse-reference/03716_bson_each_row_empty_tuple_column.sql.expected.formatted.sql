CREATE TABLE t0
(
    c0 Int32,
    c1 Tuple()
)
ENGINE = Memory;

CREATE TABLE random_filename
(
    name String
)
ENGINE = Memory;

SELECT *
FROM t0
ORDER BY c0 ASC;