CREATE TABLE ttl_03519_1
(
    date Date32,
    date_key Int
)
ENGINE = MergeTree
ORDER BY date
TTL date + toIntervalMonth(1);

SELECT *
FROM ttl_03519_1
ORDER BY date ASC
FORMAT CSV;

CREATE TABLE ttl_03519_2
(
    date DateTime64(5, 'UTC'),
    date_key Int
)
ENGINE = MergeTree
ORDER BY date
TTL date + toIntervalMonth(1);

SELECT *
FROM ttl_03519_2
ORDER BY date ASC
FORMAT CSV;

CREATE TABLE ttl_03519_3
(
    date Date32,
    str String TTL date + toIntervalMonth(1)
)
ENGINE = MergeTree
ORDER BY date;

SELECT *
FROM ttl_03519_3
ORDER BY date ASC
FORMAT CSV;

CREATE TABLE ttl_03519_4
(
    date DateTime64(5, 'UTC'),
    str String TTL date + toIntervalMonth(1)
)
ENGINE = MergeTree
ORDER BY date;

SELECT *
FROM ttl_03519_4
ORDER BY date ASC
FORMAT CSV;