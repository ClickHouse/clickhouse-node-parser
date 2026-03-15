CREATE NAMED COLLECTION `02918_json_fuzzer` AS json_str = '{}';

SELECT *
FROM fuzzJSON(`02918_json_fuzzer`, random_seed = 54321)
LIMIT 10;

SELECT *
FROM fuzzJSON(`02918_json_fuzzer`, json_str = '{"ClickHouse":"Is Fast"}', random_seed = 1337)
LIMIT 20;

SELECT *
FROM fuzzJSON(`02918_json_fuzzer`, json_str = '{"students":[{"name":"Alice"}, {"name":"Bob"}]}', random_seed = 1337)
LIMIT 20;

SELECT *
FROM fuzzJSON(`02918_json_fuzzer`, json_str = '{"schedule":[{"breakfast":"7am"}, {"lunch":"12pm"}]}', random_seed = 123456, reuse_output = true)
LIMIT 20;

SELECT *
FROM fuzzJSON(`02918_json_fuzzer`, json_str = '{"schedule":[{"breakfast":"7am"}, {"lunch":"12pm"}]}', random_seed = 123456, reuse_output = false)
LIMIT 20;

SELECT *
FROM fuzzJSON(`02918_json_fuzzer`, json_str = '{"schedule":[{"breakfast":"7am"}, {"lunch":"12pm"}]}', random_seed = 123456, reuse_output = 0, max_output_length = 128)
LIMIT 20;

SELECT *
FROM fuzzJSON(`02918_json_fuzzer`, json_str = '{"schedule":[{"breakfast":"7am"}, {"lunch":"12pm"}]}', random_seed = 123456, reuse_output = 0, max_output_length = 65536, max_nesting_level = 10, max_array_size = 20)
LIMIT 20;

SELECT *
FROM fuzzJSON(`02918_json_fuzzer`, random_seed = 6667, max_nesting_level = 0)
LIMIT 10;

SELECT *
FROM fuzzJSON(`02918_json_fuzzer`, random_seed = 6667, max_object_size = 0, max_array_size = 0)
LIMIT 10;

CREATE TABLE `02918_table_str`
(
    json_str String
)
ENGINE = Memory;

SELECT count()
FROM `02918_table_str`;

--
SELECT *
FROM fuzzJSON(`02918_json_fuzzer`, max_output_length = Hello)
LIMIT 10; -- { serverError BAD_ARGUMENTS }

SELECT *
FROM fuzzJSON(`02918_json_fuzzer`, max_output_length = 65537)
LIMIT 10; -- { serverError BAD_ARGUMENTS }

SELECT *
FROM fuzzJSON(`02918_json_fuzzer`, probability = 10)
LIMIT 10; -- { serverError BAD_ARGUMENTS }

SELECT *
FROM fuzzJSON(`02918_json_fuzzer`, probability = -0.1)
LIMIT 10; -- { serverError BAD_ARGUMENTS }

SELECT *
FROM fuzzJSON(`02918_json_fuzzer`, probability = 1.1)
LIMIT 10; -- { serverError BAD_ARGUMENTS }

SELECT *
FROM fuzzJSON(`02918_json_fuzzer`, max_string_value_length = 65537)
LIMIT 10; -- { serverError BAD_ARGUMENTS }

SELECT *
FROM fuzzJSON(`02918_json_fuzzer`, max_key_length = 65537)
LIMIT 10; -- { serverError BAD_ARGUMENTS }

SELECT *
FROM fuzzJSON(`02918_json_fuzzer`, max_key_length = 10, min_key_length = 0)
LIMIT 10; -- { serverError BAD_ARGUMENTS }

SELECT *
FROM fuzzJSON(`02918_json_fuzzer`, max_key_length = 10, min_key_length = 11)
LIMIT 10; -- { serverError BAD_ARGUMENTS }

SELECT *
FROM fuzzJSON(`02918_json_fuzzer`, equals(random_seed, viewExplain('EXPLAIN', 'actions = 1', (
        SELECT count(*)
        FROM numbers(10)
    )), 54321))
LIMIT 10; -- { serverError BAD_ARGUMENTS }