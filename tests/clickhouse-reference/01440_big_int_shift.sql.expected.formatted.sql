SELECT
    bitShiftLeft(toInt128(1), number) AS x,
    bitShiftRight(x, number) AS y,
    toTypeName(x),
    toTypeName(y)
FROM numbers(127)
ORDER BY number ASC;

SELECT
    bitShiftLeft(toInt256(1), number) AS x,
    bitShiftRight(x, number) AS y,
    toTypeName(x),
    toTypeName(y)
FROM numbers(255)
ORDER BY number ASC;

SELECT
    bitShiftLeft(toUInt256(1), number) AS x,
    bitShiftRight(x, number) AS y,
    toTypeName(x),
    toTypeName(y)
FROM numbers(256)
ORDER BY number ASC;