SELECT
    toUInt32(x),
    y,
    z
FROM pk
WHERE (x >= toDateTime(100000))
    AND (x <= toDateTime(90000));