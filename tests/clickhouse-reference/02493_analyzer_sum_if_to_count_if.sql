SELECT '--';
SELECT sumIf(1, (number % 2) == 0) FROM numbers(10);
SELECT sum(if((number % 2) == 0, 1, 0)) FROM numbers(10);
SELECT sum(if((number % 2) == 0, 0, 1)) FROM numbers(10);
