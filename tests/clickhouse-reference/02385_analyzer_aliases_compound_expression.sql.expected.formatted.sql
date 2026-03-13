SELECT
    cast(tuple(1, 'Value'), 'Tuple(first UInt64, second String)') AS value,
    value.`first`,
    value.second;

SELECT '--';

SELECT *
FROM
    (
        SELECT 1
    ) AS t1
CROSS JOIN t1 AS t2;

SELECT *
FROM
    t1 AS t2
CROSS JOIN (
        SELECT 1
    ) AS t1;

SELECT *
FROM
    (
        SELECT 1
    ) AS t1
CROSS JOIN t1.nested AS t2; -- { serverError UNKNOWN_IDENTIFIER }

SELECT *
FROM
    t1.nested AS t2
CROSS JOIN (
        SELECT 1
    ) AS t1; -- { serverError UNKNOWN_IDENTIFIER }