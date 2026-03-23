-- Random settings limits: index_granularity=(None, 60000)
-- Tags: long
-- test is derived from 03246_alter_from_string_to_json.sql
SET max_block_size = 20000;

SYSTEM drop  table if exists test;

CREATE TABLE test
(
    x UInt64,
    json String
)
ENGINE = MergeTree
ORDER BY x;

INSERT INTO test SELECT
    number,
    toJSONString(map(concat('key', multiIf(number < 60000, number % 2, number < 120000, number % 2 + 2, number % 2 + 4)), concat('value', number)))
FROM numbers(200000);

SET optimize_read_in_order = 0; -- disabling read in order optimization leads to error

SELECT json
FROM test
ORDER BY x ASC
LIMIT 10
OFFSET 120000;

SELECT
    json.key0,
    json.key1,
    json.key2,
    json.key3,
    json.key4,
    json.key5
FROM test
ORDER BY x ASC
LIMIT 10
OFFSET 120000;

SYSTEM drop  table test;