SELECT count() FROM decimal WHERE d1 =  toDecimal32('4.2', 8);
SELECT count() FROM decimal WHERE d1 != toDecimal32('4.2', 8);
SELECT count() FROM decimal WHERE d1 <  toDecimal32('4.2', 8);
SELECT count() FROM decimal WHERE d1 >  toDecimal32('4.2', 8);
SELECT count() FROM decimal WHERE d1 <= toDecimal32('4.2', 8);
SELECT count() FROM decimal WHERE d1 >= toDecimal32('4.2', 8);
SELECT count() FROM decimal WHERE d1 = 1;
SELECT * FROM decimal WHERE d1 > 5 AND d2 < 30 ORDER BY d2 DESC;
SELECT * FROM decimal WHERE d1 IN(1, 3) ORDER BY d2;
