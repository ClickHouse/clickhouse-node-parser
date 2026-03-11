SELECT intDiv(CAST('1.0', 'Decimal256(3)'), today());

SELECT intDiv(CAST('1.0', 'Decimal256(3)'), toDate('2023-01-02'));

SELECT intDiv(CAST('1.0', 'Decimal256(2)'), toDate32('2023-01-02 12:12:12'));

SELECT intDiv(CAST('1.0', 'Decimal256(2)'), toDateTime('2023-01-02 12:12:12'));

SELECT intDiv(CAST('1.0', 'Decimal256(2)'), toDateTime64('2023-01-02 12:12:12.002', 3));