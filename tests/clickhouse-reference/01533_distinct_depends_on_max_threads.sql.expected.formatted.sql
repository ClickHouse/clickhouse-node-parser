CREATE TABLE bug_13492
(
    d DateTime
)
ENGINE = MergeTree
ORDER BY tuple()
PARTITION BY toYYYYMMDD(d);

SET max_threads = 5;

SELECT DISTINCT 1
FROM
    bug_13492
CROSS JOIN numbers(1) AS n;

SET max_threads = 2;