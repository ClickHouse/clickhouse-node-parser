SELECT s
FROM buffer_table1__fuzz_24
PREWHERE factorial(toNullable(10));

SELECT *
FROM buffer_table1__fuzz_28
PREWHERE x = toLowCardinality(1);

SELECT *
FROM buffer_table1__fuzz_28;