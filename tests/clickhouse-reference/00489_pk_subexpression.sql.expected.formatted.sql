SELECT
    toUInt32(x),
    y,
    z
FROM pk
WHERE and(greaterOrEquals(x, toDateTime(0)), lessOrEquals(x, toDateTime(59)));

SELECT
    toUInt32(x),
    y,
    z
FROM pk
WHERE and(greaterOrEquals(x, toDateTime(120)), lessOrEquals(x, toDateTime(240)));

SELECT
    toUInt32(x),
    y,
    z
FROM pk
WHERE x = toDateTime(1);

SELECT
    toUInt32(x),
    y,
    z
FROM pk
WHERE (and(greaterOrEquals(x, toDateTime(60)), lessOrEquals(x, toDateTime(119))))
    AND y = 11;

SELECT
    toUInt32(x),
    y,
    z
FROM pk
WHERE (and(greaterOrEquals(x, toDateTime(60)), lessOrEquals(x, toDateTime(120))))
    AND y = 11;