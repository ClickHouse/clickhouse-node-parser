-- Test Time and Time64 types in JSON
SET enable_time_time64_type = 1;

-- Time type in JSON
CREATE TABLE json_time_test
(
    json JSON(`time_value` Time, `id` String)
)
ENGINE = Memory;

SELECT
    json.time_value,
    json.id
FROM json_time_test
ORDER BY json.id ASC;

-- Time64 type in JSON
CREATE TABLE json_time64_test
(
    json JSON(`time_value` Time64(3), `id` String)
)
ENGINE = Memory;

SELECT
    json.time_value,
    json.id
FROM json_time64_test
ORDER BY json.id ASC;

-- #82267
CREATE TABLE json_splits
(
    json JSON(`metric.moving_time` Time, `id` String)
)
ORDER BY json.id;

SELECT
    json.`metric.moving_time`,
    json.id
FROM json_splits
ORDER BY json.id ASC;