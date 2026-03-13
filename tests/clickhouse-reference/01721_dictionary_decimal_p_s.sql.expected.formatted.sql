SELECT '-------- 42 --------';

SELECT *
FROM table_decimal_dict
WHERE KeyField = 42;

SELECT *
FROM decimal_dict
WHERE KeyField = 42;

SELECT
    dictGet('decimal_dict', 'Decimal32_', toUInt64(42)),
    dictGet('decimal_dict', 'Decimal64_', toUInt64(42)),
    dictGet('decimal_dict', 'Decimal128_', toUInt64(42));

-- ,dictGet('decimal_dict', 'Decimal256_', toUInt64(42))
SELECT *
FROM table_decimal_dict
WHERE KeyField = 4999;

SELECT *
FROM decimal_dict
WHERE KeyField = 4999;

SELECT
    dictGet('decimal_dict', 'Decimal32_', toUInt64(4999)),
    dictGet('decimal_dict', 'Decimal64_', toUInt64(4999)),
    dictGet('decimal_dict', 'Decimal128_', toUInt64(4999));

--,dictGet('decimal_dict', 'Decimal256_', toUInt64(4999))
SELECT *
FROM table_decimal_dict
WHERE KeyField = 5000;

SELECT *
FROM decimal_dict
WHERE KeyField = 5000;

SELECT
    dictGet('decimal_dict', 'Decimal32_', toUInt64(5000)),
    dictGet('decimal_dict', 'Decimal64_', toUInt64(5000)),
    dictGet('decimal_dict', 'Decimal128_', toUInt64(5000)); --,dictGet('decimal_dict', 'Decimal256_', toUInt64(5000))