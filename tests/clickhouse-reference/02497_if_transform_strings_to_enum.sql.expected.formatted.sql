SET enable_analyzer = 1;

SET optimize_if_transform_strings_to_enum = 1;

SELECT transform(number, [2, 4, 6], ['google', 'censor.net', 'yahoo'], 'other')
FROM `system`.numbers
LIMIT 10;

SELECT if(number > 5, 'censor.net', 'google')
FROM `system`.numbers
LIMIT 10;

SELECT CONCAT(transform(number, [2, 4, 6], ['google', 'censor.net', 'yahoo'], 'other'), '1')
FROM `system`.numbers
LIMIT 10;

SELECT CONCAT(if(number > 5, 'censor.net', 'google'), '1')
FROM `system`.numbers
LIMIT 10;

SELECT t1.value
FROM (
        SELECT if(number > 5, 'censor.net', 'google') AS value
        FROM `system`.numbers
        LIMIT 10
    ) AS t1;

SELECT t1.value
FROM (
        SELECT transform(number, [2, 4, 6], ['google', 'censor.net', 'yahoo'], 'other') AS value
        FROM `system`.numbers
        LIMIT 10
    ) AS t1;

SELECT
    if(number > 5, 'censor.net', 'google') AS value,
    value
FROM `system`.numbers
LIMIT 10;

SELECT
    transform(number, [2, 4, 6], ['google', 'censor.net', 'yahoo'], 'other') AS value,
    value
FROM `system`.numbers
LIMIT 10;

SELECT transform(number, [NULL], ['google', 'censor.net', 'yahoo'], 'other')
FROM (
        SELECT NULL AS number
        FROM `system`.numbers
        LIMIT 10
    );

SELECT transform(number, NULL, ['google', 'censor.net', 'yahoo'], 'other')
FROM `system`.numbers
LIMIT 10; -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }

SET optimize_if_transform_strings_to_enum = 0;