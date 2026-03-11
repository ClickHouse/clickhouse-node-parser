SELECT uniq(if(number >= 10, number, NULL))
FROM numbers(10);

SELECT uniqExact(if(number >= 10, number, NULL))
FROM numbers(10);

SELECT countDistinct(if(number >= 10, number, NULL))
FROM numbers(10);

SELECT uniq(if(number >= 5, number, NULL))
FROM numbers(10);

SELECT uniqExact(if(number >= 5, number, NULL))
FROM numbers(10);

SELECT countDistinct(if(number >= 5, number, NULL))
FROM numbers(10);

SELECT '---';

SELECT count(NULL);

SELECT uniq(NULL);

SELECT countDistinct(NULL);

SELECT avg(NULL);

SELECT sum(NULL);

SELECT corr(NULL, NULL);

SELECT corr(1, NULL);

SELECT corr(NULL, 1);