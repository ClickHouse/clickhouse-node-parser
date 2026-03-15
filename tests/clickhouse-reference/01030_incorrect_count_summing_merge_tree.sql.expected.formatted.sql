SET optimize_on_insert = 0;

SELECT '-- SummingMergeTree with Nullable column without duplicates.';

CREATE TABLE tst
(
    timestamp DateTime,
    val Nullable(Int8)
)
ENGINE = SummingMergeTree
ORDER BY (timestamp)
PARTITION BY toYYYYMM(timestamp);

SELECT *
FROM tst FINAL
ORDER BY timestamp ASC;

SELECT count()
FROM tst;

SELECT count()
FROM tst FINAL;

SELECT count()
FROM tst
WHERE isNotNull(timestamp);

SELECT count()
FROM tst FINAL
WHERE isNotNull(timestamp);

SELECT count()
FROM tst
WHERE isNotNull(val);

SELECT count()
FROM tst FINAL
WHERE isNotNull(val);

SELECT count()
FROM tst FINAL
WHERE timestamp > 0;

SELECT count()
FROM tst FINAL
PREWHERE timestamp > 0;

SELECT count()
FROM tst FINAL
WHERE timestamp > '2017-01-01 00:00:00';

SELECT count()
FROM tst FINAL
PREWHERE timestamp > '2017-01-01 00:00:00';

SELECT count()
FROM tst FINAL
WHERE val > 0;

SELECT count()
FROM tst FINAL
PREWHERE val > 0;

CREATE TABLE tst
(
    timestamp DateTime,
    val Int8
)
ENGINE = SummingMergeTree
ORDER BY (timestamp)
PARTITION BY toYYYYMM(timestamp);