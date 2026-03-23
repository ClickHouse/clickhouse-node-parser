CREATE TABLE weird_partitions_02245
(
    d DateTime,
    d1 DateTime DEFAULT d - toIntervalHour(8),
    id Int64
)
ENGINE = MergeTree
ORDER BY id
PARTITION BY (toYYYYMM(toDateTime(d)), ignore(d1));

INSERT INTO weird_partitions_02245 (d, id) SELECT
    toDateTime('2021-12-31 22:30:00') AS d,
    number
FROM numbers(1000);

INSERT INTO weird_partitions_02245 (d, id) SELECT
    toDateTime('2022-01-01 00:30:00') AS d,
    number
FROM numbers(1000);

INSERT INTO weird_partitions_02245 (d, id) SELECT
    toDateTime('2022-01-31 22:30:00') AS d,
    number
FROM numbers(1000);

INSERT INTO weird_partitions_02245 (d, id) SELECT
    toDateTime('2023-01-31 22:30:00') AS d,
    number
FROM numbers(1000);

SELECT DISTINCT
    _partition_id,
    _partition_value
FROM weird_partitions_02245
ORDER BY _partition_id ASC;

SELECT
    _partition_id,
    min(d),
    max(d),
    min(d1),
    max(d1),
    count()
FROM weird_partitions_02245
GROUP BY _partition_id
ORDER BY _partition_id ASC;

SELECT DISTINCT _partition_id
FROM weird_partitions_02245
WHERE d >= '2021-12-31 00:00:00'
    AND d < '2022-01-01 00:00:00'
ORDER BY _partition_id ASC;

SELECT DISTINCT _partition_id
FROM weird_partitions_02245
WHERE d >= '2022-01-01 00:00:00'
    AND d1 >= '2021-12-31 00:00:00'
    AND d1 < '2022-01-01 00:00:00'
ORDER BY _partition_id ASC;

SELECT DISTINCT _partition_id
FROM weird_partitions_02245
WHERE d1 >= '2021-12-31 00:00:00'
    AND d1 < '2022-01-01 00:00:00'
ORDER BY _partition_id ASC;

SELECT DISTINCT _partition_id
FROM weird_partitions_02245
WHERE d >= '2022-01-01 00:00:00'
    AND d1 >= '2021-12-31 00:00:00'
    AND d1 < '2020-01-01 00:00:00'
ORDER BY _partition_id ASC;