SELECT toString(x)::Decimal(6, 3)
FROM generateRandom('x Decimal(6, 3)', 42)
LIMIT 5;

SELECT toString(x)::Decimal(15, 9)
FROM generateRandom('x Decimal(15, 9)', 42)
LIMIT 5;

SELECT toString(x)::Decimal(30, 20)
FROM generateRandom('x Decimal(30, 20)', 42)
LIMIT 5;

SELECT toString(x)::Decimal(60, 40)
FROM generateRandom('x Decimal(60, 40)', 42)
LIMIT 5;

SELECT reinterpret(x, 'UInt8')
FROM generateRandom('x Bool', 42)
LIMIT 5;