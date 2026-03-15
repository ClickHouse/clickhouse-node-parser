SELECT 1 / CAST(NULL, 'Nullable(Decimal(7, 2))');

SELECT materialize(1) / CAST(NULL, 'Nullable(Decimal(7, 2))');

SELECT 1 / CAST(materialize(NULL), 'Nullable(Decimal(7, 2))');

SELECT materialize(1) / CAST(materialize(NULL), 'Nullable(Decimal(7, 2))');

SELECT 1 / CAST(1, 'Nullable(Decimal(7, 2))');

SELECT materialize(1) / CAST(1, 'Nullable(Decimal(7, 2))');

SELECT 1 / CAST(materialize(1), 'Nullable(Decimal(7, 2))');

SELECT materialize(1) / CAST(materialize(1), 'Nullable(Decimal(7, 2))');

SELECT intDiv(1, CAST(NULL, 'Nullable(Decimal(7, 2))'));

SELECT intDiv(materialize(1), CAST(NULL, 'Nullable(Decimal(7, 2))'));

SELECT intDiv(1, CAST(materialize(NULL), 'Nullable(Decimal(7, 2))'));

SELECT intDiv(materialize(1), CAST(materialize(NULL), 'Nullable(Decimal(7, 2))'));

SELECT intDiv(1, CAST(1, 'Nullable(Decimal(7, 2))'));

SELECT intDiv(materialize(1), CAST(1, 'Nullable(Decimal(7, 2))'));

SELECT intDiv(1, CAST(materialize(1), 'Nullable(Decimal(7, 2))'));

SELECT intDiv(materialize(1), CAST(materialize(1), 'Nullable(Decimal(7, 2))'));

SELECT toDecimal32(1, 2) / CAST(NULL, 'Nullable(UInt32)');

SELECT materialize(toDecimal32(1, 2)) / CAST(NULL, 'Nullable(UInt32)');

SELECT toDecimal32(1, 2) / CAST(materialize(NULL), 'Nullable(UInt32)');

SELECT materialize(toDecimal32(1, 2)) / CAST(materialize(NULL), 'Nullable(UInt32)');

SELECT toDecimal32(1, 2) / CAST(1, 'Nullable(UInt32)');

SELECT materialize(toDecimal32(1, 2)) / CAST(1, 'Nullable(UInt32)');

SELECT toDecimal32(1, 2) / CAST(materialize(1), 'Nullable(UInt32)');

SELECT materialize(toDecimal32(1, 2)) / CAST(materialize(1), 'Nullable(UInt32)');

SELECT intDiv(1, CAST(NULL, 'Nullable(UInt32)'));

SELECT intDiv(materialize(1), CAST(NULL, 'Nullable(UInt32)'));

SELECT intDiv(1, CAST(materialize(NULL), 'Nullable(UInt32)'));

SELECT intDiv(materialize(1), CAST(materialize(NULL), 'Nullable(UInt32)'));

SELECT intDiv(1, CAST(1, 'Nullable(UInt32)'));

SELECT intDiv(materialize(1), CAST(1, 'Nullable(UInt32)'));

SELECT intDiv(1, CAST(materialize(1), 'Nullable(UInt32)'));

SELECT intDiv(materialize(1), CAST(materialize(1), 'Nullable(UInt32)'));

SELECT 1 % CAST(NULL, 'Nullable(UInt32)');

SELECT materialize(1) % CAST(NULL, 'Nullable(UInt32)');

SELECT 1 % CAST(materialize(NULL), 'Nullable(UInt32)');

SELECT materialize(1) % CAST(materialize(NULL), 'Nullable(UInt32)');

SELECT 1 % CAST(1, 'Nullable(UInt32)');

SELECT materialize(1) % CAST(1, 'Nullable(UInt32)');

SELECT 1 % CAST(materialize(1), 'Nullable(UInt32)');

SELECT materialize(1) % CAST(materialize(1), 'Nullable(UInt32)');

SELECT intDiv(1, CAST(NULL, 'Nullable(Float32)'));

SELECT intDiv(materialize(1), CAST(NULL, 'Nullable(Float32)'));

SELECT intDiv(1, CAST(materialize(NULL), 'Nullable(Float32)'));

SELECT intDiv(materialize(1), CAST(materialize(NULL), 'Nullable(Float32)'));

SELECT intDiv(1, CAST(1, 'Nullable(Float32)'));

SELECT intDiv(materialize(1), CAST(1, 'Nullable(Float32)'));

SELECT intDiv(1, CAST(materialize(1), 'Nullable(Float32)'));

SELECT intDiv(materialize(1), CAST(materialize(1), 'Nullable(Float32)'));

SELECT 1 % CAST(NULL, 'Nullable(Float32)');

SELECT materialize(1) % CAST(NULL, 'Nullable(Float32)');

SELECT 1 % CAST(materialize(NULL), 'Nullable(Float32)');

SELECT materialize(1) % CAST(materialize(NULL), 'Nullable(Float32)');

SELECT 1 % CAST(1, 'Nullable(Float32)');

SELECT materialize(1) % CAST(1, 'Nullable(Float32)');

SELECT 1 % CAST(materialize(1), 'Nullable(Float32)');

SELECT materialize(1) % CAST(materialize(1), 'Nullable(Float32)');

CREATE TABLE nullable_division
(
    x UInt32,
    y Nullable(UInt32),
    a Decimal(7, 2),
    b Nullable(Decimal(7, 2))
)
ENGINE = MergeTree()
ORDER BY x;

SELECT if(y = 0, 0, intDiv(x, y))
FROM nullable_division;

SELECT if(y = 0, 0, x % y)
FROM nullable_division;

SELECT if(y = 0, 0, intDiv(a, y))
FROM nullable_division;

SELECT if(y = 0, 0, a / y)
FROM nullable_division;

SELECT if(b = 0, 0, intDiv(a, b))
FROM nullable_division;

SELECT if(b = 0, 0, a / b)
FROM nullable_division;

SELECT if(b = 0, 0, intDiv(x, b))
FROM nullable_division;

SELECT if(b = 0, 0, x / b)
FROM nullable_division;