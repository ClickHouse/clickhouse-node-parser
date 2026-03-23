-- Tags: long, no-debug, no-tsan, no-asan, no-ubsan, no-msan, no-parallel
-- no-parallel because the sets use a lot of memory, which may interfere with other tests
SYSTEM DROP  TABLE IF EXISTS 02581_trips;

CREATE TABLE `02581_trips`
(
    id UInt32,
    description String,
    id2 UInt32,
    PRIMARY KEY(id)
)
ENGINE = MergeTree
ORDER BY id;

-- Make multiple parts
INSERT INTO `02581_trips` SELECT
    number,
    '',
    number
FROM numbers(10000);

INSERT INTO `02581_trips` SELECT
    number + 10000000,
    '',
    number
FROM numbers(10000);

INSERT INTO `02581_trips` SELECT
    number + 20000000,
    '',
    number
FROM numbers(10000);

INSERT INTO `02581_trips` SELECT
    number + 30000000,
    '',
    number
FROM numbers(10000);

SELECT count()
FROM `02581_trips`
WHERE description = '';

SELECT name
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = '02581_trips'
    AND active
ORDER BY name ASC;

SET max_rows_to_read = 0; -- system.text_log can be really big

SYSTEM DROP  TABLE 02581_trips;