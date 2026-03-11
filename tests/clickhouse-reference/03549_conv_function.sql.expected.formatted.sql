SELECT conv('10', 10, 2);

SELECT conv('255', 10, 16);

SELECT conv('FF', 16, 10);

SELECT conv('1010', 2, 8);

SELECT conv('12', 8, 10);

SELECT conv('AbC', 16, 10);

SELECT conv('-10', 10, 2);

SELECT conv('-255', 10, 16);

SELECT conv('-1', 10, 16);

SELECT conv('  123  ', 10, 16);

SELECT conv(' -456 ', 10, 8);

SELECT conv('0', 10, 2);

SELECT conv('0', 16, 10);

SELECT conv('123XYZ', 10, 16);

SELECT conv('FF99GG', 16, 10);

SELECT conv('1012', 2, 10);

SELECT conv('10', 2, 36);

SELECT conv('ZZ', 36, 10);

SELECT conv('10', 36, 2);

SELECT conv('18446744073709551615', 10, 16);

SELECT conv('FFFFFFFFFFFFFFFF', 16, 10);

SELECT conv('999999999999999999999', 10, 16);

SELECT conv(' ', 16, 10);

SELECT conv(255, 10, 16);

SELECT conv(1010, 2, 10);

SELECT conv(-123, 10, 16);

SELECT conv(toString(number), 10, 16)
FROM `system`.numbers
LIMIT 5;

SELECT conv(number, 10, 2)
FROM `system`.numbers
WHERE number < 8;

SELECT conv('FF', 16, 10)
FROM `system`.numbers
LIMIT 3;

SELECT
    conv(toString(number), 10, 36),
    conv(toString(number), 10, 2)
FROM `system`.numbers
WHERE and(greaterOrEquals(number, 10), lessOrEquals(number, 15));