SELECT d
FROM values('d Decimal(8, 8)', 0, 1)
WHERE d NOT IN (-1, 0);

SELECT d
FROM values('d Decimal(8, 8)', 0, 2)
WHERE d NOT IN (1, 0);

SELECT d
FROM values('d Decimal(9, 8)', 0, 3)
WHERE d NOT IN (-9223372036854775808, 0);

SELECT d
FROM values('d Decimal(9, 8)', 0, 4)
WHERE d NOT IN (18446744073709551615, 0);

SELECT d
FROM values('d Decimal(18, 8)', 0, 5)
WHERE d NOT IN (-9223372036854775808, 0);

SELECT d
FROM values('d Decimal(18, 8)', 0, 6)
WHERE d NOT IN (18446744073709551615, 0);

SELECT d
FROM values('d Decimal(26, 8)', 0, 7)
WHERE d NOT IN (-9223372036854775808, 0);

SELECT d
FROM values('d Decimal(27, 8)', 0, 8)
WHERE d NOT IN (18446744073709551615, 0);

SELECT d
FROM values('d Decimal(27, 8)', 0, 9)
WHERE d NOT IN (-9223372036854775808, 0);

SELECT d
FROM values('d Decimal(28, 8)', 0, 10)
WHERE d NOT IN (18446744073709551615, 0);