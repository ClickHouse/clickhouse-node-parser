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

SELECT *
FROM (
        SELECT
            c,
            min(w) OVER (PARTITION BY s ORDER BY c ASC, s ASC, w ASC)
        FROM t
        LIMIT toUInt64(-1)
    )
WHERE c = -755809149;