CREATE TABLE t
(
    c Int32,
    d Bool
)
ENGINE = MergeTree
ORDER BY c;

SELECT
    d,
    c,
    row_number() OVER (PARTITION BY d ORDER BY c ASC) AS c8
FROM t
ORDER BY d ASC
QUALIFY c8 = 1
SETTINGS
    max_threads = 2,
    enable_analyzer = 1;

SELECT '---';

SELECT
    d,
    c,
    row_number() OVER (PARTITION BY d ORDER BY c ASC) AS c8
FROM t
ORDER BY
    d ASC,
    c8 ASC
SETTINGS max_threads = 2;

CREATE TABLE t
(
    c Int32 PRIMARY KEY,
    s Bool,
    w Float64
)
PRIMARY KEY c;

SELECT *
FROM (
        SELECT
            c,
            min(w) OVER (PARTITION BY s ORDER BY c ASC, s ASC, w ASC)
        FROM t
        LIMIT toUInt64(-1)
    )
WHERE c = -755809149;