CREATE TABLE lwd_test
(
    id UInt64,
    value String
)
ENGINE = MergeTree()
ORDER BY id
SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';

INSERT INTO lwd_test SELECT
    number,
    randomString(10)
FROM `system`.numbers
LIMIT 1000000;

SET mutations_sync = 0;

SELECT
    'Rows in parts',
    SUM(`rows`)
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 'lwd_test'
    AND active;

SELECT
    'Count',
    count()
FROM lwd_test;

SELECT
    'First row',
    id,
    length(value)
FROM lwd_test
ORDER BY id ASC
LIMIT 1;