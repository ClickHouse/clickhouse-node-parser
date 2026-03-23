-- Row TTL with extended data types
DROP TABLE IF EXISTS ttl_03519_1;

CREATE TABLE ttl_03519_1
(
    date Date32,
    date_key Int
)
ENGINE = MergeTree
ORDER BY date
TTL date + toIntervalMonth(1);

INSERT INTO ttl_03519_1;

INSERT INTO ttl_03519_1;

INSERT INTO ttl_03519_1;

SELECT *
FROM ttl_03519_1
ORDER BY date ASC
FORMAT CSV;

DROP TABLE ttl_03519_1;

DROP TABLE IF EXISTS ttl_03519_2;

CREATE TABLE ttl_03519_2
(
    date DateTime64(5, 'UTC'),
    date_key Int
)
ENGINE = MergeTree
ORDER BY date
TTL date + toIntervalMonth(1);

INSERT INTO ttl_03519_2;

INSERT INTO ttl_03519_2;

INSERT INTO ttl_03519_2;

SELECT *
FROM ttl_03519_2
ORDER BY date ASC
FORMAT CSV;

DROP TABLE ttl_03519_2;

-- Column TTL with extended data types
DROP TABLE IF EXISTS ttl_03519_3;

CREATE TABLE ttl_03519_3
(
    date Date32,
    str String TTL date + toIntervalMonth(1)
)
ENGINE = MergeTree
ORDER BY date;

INSERT INTO ttl_03519_3;

INSERT INTO ttl_03519_3;

INSERT INTO ttl_03519_3;

SELECT *
FROM ttl_03519_3
ORDER BY date ASC
FORMAT CSV;

DROP TABLE ttl_03519_3;

DROP TABLE IF EXISTS ttl_03519_4;

CREATE TABLE ttl_03519_4
(
    date DateTime64(5, 'UTC'),
    str String TTL date + toIntervalMonth(1)
)
ENGINE = MergeTree
ORDER BY date;

INSERT INTO ttl_03519_4;

INSERT INTO ttl_03519_4;

INSERT INTO ttl_03519_4;

SELECT *
FROM ttl_03519_4
ORDER BY date ASC
FORMAT CSV;

DROP TABLE ttl_03519_4;