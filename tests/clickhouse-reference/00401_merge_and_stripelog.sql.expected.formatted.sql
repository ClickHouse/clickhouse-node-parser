CREATE TABLE stripe1
ENGINE = StripeLog AS
SELECT number AS x
FROM `system`.numbers
LIMIT 10;

CREATE TABLE stripe2
ENGINE = StripeLog AS
SELECT number AS x
FROM `system`.numbers
LIMIT 10;

CREATE TABLE stripe3
ENGINE = StripeLog AS
SELECT number AS x
FROM `system`.numbers
LIMIT 10;

CREATE TABLE stripe4
ENGINE = StripeLog AS
SELECT number AS x
FROM `system`.numbers
LIMIT 10;

CREATE TABLE stripe5
ENGINE = StripeLog AS
SELECT number AS x
FROM `system`.numbers
LIMIT 10;

CREATE TABLE stripe6
ENGINE = StripeLog AS
SELECT number AS x
FROM `system`.numbers
LIMIT 10;

CREATE TABLE stripe7
ENGINE = StripeLog AS
SELECT number AS x
FROM `system`.numbers
LIMIT 10;

CREATE TABLE stripe8
ENGINE = StripeLog AS
SELECT number AS x
FROM `system`.numbers
LIMIT 10;

CREATE TABLE stripe9
ENGINE = StripeLog AS
SELECT number AS x
FROM `system`.numbers
LIMIT 10;

CREATE TABLE stripe10
ENGINE = StripeLog AS
SELECT number AS x
FROM `system`.numbers
LIMIT 10;

CREATE TABLE merge_00401 AS stripe1
ENGINE = Merge(currentDatabase(), '^stripe\\d+');

SELECT
    x,
    count()
FROM merge_00401
GROUP BY x
ORDER BY x ASC;

SET max_threads = 1;

SET max_threads = 2;

SET max_threads = 5;

SET max_threads = 10;

SET max_threads = 20;