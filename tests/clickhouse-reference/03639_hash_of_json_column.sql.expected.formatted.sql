SET session_timezone = 'UTC';

SELECT sipHash64('{"a" : 42, "b" : "str", "c" : [{"d" : 1}, {"e" : 2}]}'::JSON);

SELECT sipHash64('{"a" : 42, "b" : "str", "c" : [{"d" : 1}, {"e" : 2}], "f" : null}'::JSON);

SELECT sipHash64('{"a" : 42, "b" : "str", "c" : [{"d" : 1}, {"e" : 2}]}'::JSON(max_dynamic_paths=100));

SELECT sipHash64('{"a" : 42, "b" : "str", "c" : [{"d" : 1}, {"e" : 2}]}'::JSON(max_dynamic_paths=1));

SELECT sipHash64('{"a" : 42, "b" : "str", "c" : [{"d" : 1}, {"e" : 2}]}'::JSON(max_dynamic_paths=0));

SELECT sipHash64('{"a" : 42, "b" : "str", "c" : [{"d" : 1}, {"e" : 2}]}'::JSON(max_dynamic_types=0));

SELECT sipHash64('{"a" : 42, "b" : "str", "c" : [{"d" : 1}, {"e" : 2}]}'::JSON(a Int64));

SELECT sipHash64('{"a" : 42, "b" : "str", "c" : [{"d" : 1}, {"e" : 2}]}'::JSON(a Dynamic));

SELECT sipHash64('{"a" : 42, "b" : "str", "c" : [{"d" : 1}, {"e" : 2}]}'::JSON(SKIP REGEXP '(abc)'));

SELECT sipHash64('{"a" : "1970-01-01 00:00:00.000000042", "b" : "str", "c" : [{"d" : 1}, {"e" : 2}]}'::JSON);

SELECT sipHash64(tuple(map('json', [toNullable('{"a" : 42, "b" : "str", "c" : [{"d" : 1}, {"e" : 2}]}'::JSON)])));

SELECT sipHash64(tuple(map('json', [toNullable('{"a" : 42, "b" : "str", "c" : [{"d" : 1}, {"e" : 2}], "f" : null}'::JSON)])));

SELECT sipHash64(tuple(map('json', [toNullable('{"a" : 42, "b" : "str", "c" : [{"d" : 1}, {"e" : 2}]}'::JSON(max_dynamic_paths=100))])));

SELECT sipHash64(tuple(map('json', [toNullable('{"a" : 42, "b" : "str", "c" : [{"d" : 1}, {"e" : 2}]}'::JSON(max_dynamic_paths=1))])));

SELECT sipHash64(tuple(map('json', [toNullable('{"a" : 42, "b" : "str", "c" : [{"d" : 1}, {"e" : 2}]}'::JSON(max_dynamic_paths=0))])));

SELECT sipHash64(tuple(map('json', [toNullable('{"a" : 42, "b" : "str", "c" : [{"d" : 1}, {"e" : 2}]}'::JSON(max_dynamic_types=0))])));

SELECT sipHash64(tuple(map('json', [toNullable('{"a" : 42, "b" : "str", "c" : [{"d" : 1}, {"e" : 2}]}'::JSON(a Int64))])));

SELECT sipHash64(tuple(map('json', [toNullable('{"a" : 42, "b" : "str", "c" : [{"d" : 1}, {"e" : 2}]}'::JSON(a Dynamic))])));

CREATE TABLE test
(
    json JSON
)
ENGINE = Memory;

SELECT
    json,
    sipHash64(json)
FROM test;

CREATE TABLE test
(
    json JSON(max_dynamic_types=0)
)
ENGINE = Memory;

CREATE TABLE test
(
    json JSON(max_dynamic_paths=0)
)
ENGINE = Memory;