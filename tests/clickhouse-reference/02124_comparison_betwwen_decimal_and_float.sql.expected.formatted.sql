SELECT CAST(1.0, 'Decimal(15,2)') > CAST(1, 'Float64');

SELECT CAST(1.0, 'Decimal(15,2)') = CAST(1, 'Float64');

SELECT CAST(1.0, 'Decimal(15,2)') < CAST(1, 'Float64');

SELECT CAST(1.0, 'Decimal(15,2)') != CAST(1, 'Float64');

SELECT CAST(1.0, 'Decimal(15,2)') > CAST(-1, 'Float64');

SELECT CAST(1.0, 'Decimal(15,2)') = CAST(-1, 'Float64');

SELECT CAST(1.0, 'Decimal(15,2)') < CAST(-1, 'Float64');

SELECT CAST(1.0, 'Decimal(15,2)') != CAST(-1, 'Float64');

SELECT CAST(1.0, 'Decimal(15,2)') > CAST(1, 'Float32');

SELECT CAST(1.0, 'Decimal(15,2)') = CAST(1, 'Float32');

SELECT CAST(1.0, 'Decimal(15,2)') < CAST(1, 'Float32');

SELECT CAST(1.0, 'Decimal(15,2)') != CAST(1, 'Float32');

SELECT CAST(1.0, 'Decimal(15,2)') > CAST(-1, 'Float32');

SELECT CAST(1.0, 'Decimal(15,2)') = CAST(-1, 'Float32');

SELECT CAST(1.0, 'Decimal(15,2)') < CAST(-1, 'Float32');

SELECT CAST(1.0, 'Decimal(15,2)') != CAST(-1, 'Float32');

SELECT toDecimal32('11.00', 2) > 1.;

SELECT 0.1000000000000000055511151231257827021181583404541015625::Decimal256(70) = 0.1;

SELECT d1 > f1
FROM t
ORDER BY f1 ASC;

SELECT d2 > f1
FROM t
ORDER BY f1 ASC;

SELECT d3 > f1
FROM t
ORDER BY f1 ASC;

SELECT d4 > f1
FROM t
ORDER BY f1 ASC;

SELECT d1 > f2
FROM t
ORDER BY f2 ASC;

SELECT d2 > f2
FROM t
ORDER BY f2 ASC;

SELECT d3 > f2
FROM t
ORDER BY f2 ASC;

SELECT d4 > f2
FROM t
ORDER BY f2 ASC;