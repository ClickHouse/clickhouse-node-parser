SELECT sum((2 * id) as func), func FROM test_table GROUP BY id;
SELECT max(100-number), min(100-number) FROM numbers(2);
select (sum(toDecimal64(2.11, 15) - number), 1) FROM numbers(2);
