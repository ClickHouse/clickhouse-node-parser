SELECT
    toUInt64OrZero(s),
    toUInt64OrNull(s)
FROM (
        SELECT multiIf(number % 2 = 1, toString(number), 'hello') AS s
        FROM `system`.numbers
    )
LIMIT 10;

SELECT
    toUInt64OrZero(s),
    toUInt64OrNull(s)
FROM (
        SELECT multiIf(number = 5, NULL, number % 2 = 1, toString(number), 'hello') AS s
        FROM `system`.numbers
    )
LIMIT 10;