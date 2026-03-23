-- Tags: no-tsan, no-asan, no-ubsan, no-msan, no-fasttest
-- no-fasttest: Slow test
-- no sanitizers: too slow sometimes
SYSTEM DROP  TABLE IF EXISTS 02581_trips;

CREATE TABLE `02581_trips`
(
    id UInt32,
    id2 UInt32,
    description String
)
ENGINE = MergeTree
ORDER BY id
SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';

-- Make multiple parts
INSERT INTO `02581_trips` SELECT
    number,
    number,
    ''
FROM numbers(10000);

INSERT INTO `02581_trips` SELECT
    number + 10000,
    number + 10000,
    ''
FROM numbers(10000);

INSERT INTO `02581_trips` SELECT
    number + 20000,
    number + 20000,
    ''
FROM numbers(10000);

INSERT INTO `02581_trips` SELECT
    number + 30000,
    number + 30000,
    ''
FROM numbers(10000);

-- { echoOn }
SELECT
    count(),
    _part
FROM `02581_trips`
GROUP BY _part
ORDER BY _part ASC;

SELECT
    count(),
    _part
FROM `02581_trips`
WHERE description = ''
GROUP BY _part
ORDER BY _part ASC;

SELECT count()
FROM `02581_trips`
WHERE description = '';

-- { echoOff }
SYSTEM DROP  TABLE 02581_trips;