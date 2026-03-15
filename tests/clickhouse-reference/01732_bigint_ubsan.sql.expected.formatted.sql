CREATE TEMPORARY TABLE decimal
(
    f dec(38, 38)
);

SELECT
    f + 1048575,
    f - 21,
    f - 84,
    f * 21,
    f * -21,
    f / 21,
    f / 84
FROM decimal
WHERE f > 0; -- { serverError DECIMAL_OVERFLOW }

SELECT
    f + -2,
    f - 21,
    f - 84,
    f * 21,
    f * -21,
    f / 9223372036854775807,
    f / 84
FROM decimal
WHERE f > 0; -- { serverError DECIMAL_OVERFLOW }