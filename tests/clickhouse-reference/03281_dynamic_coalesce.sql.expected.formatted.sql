SELECT coalesce(if(number % 2, NULL, number::Dynamic), 42) AS res
FROM numbers(5);

SELECT coalesce(if(number % 2, NULL, number::Dynamic), if(number % 3, NULL, 42)) AS res
FROM numbers(5);

SELECT coalesce(if(number % 2, NULL, number), if(number % 3, NULL, 42::Dynamic)) AS res
FROM numbers(5);

SELECT coalesce(if(number % 2, NULL, number::Dynamic), if(number % 3, NULL, 42::Dynamic)) AS res
FROM numbers(5);

SELECT coalesce(if(number % 2, NULL, number::Dynamic), if(number % 3, NULL, 42), if(number % 4 == 1, NULL, 43)) AS res
FROM numbers(10);

SELECT coalesce(if(number % 2, NULL, number), if(number % 3, NULL, 42::Dynamic), if(number % 4 == 1, NULL, 43)) AS res
FROM numbers(10);

SELECT coalesce(if(number % 2, NULL, number), if(number % 3, NULL, 42), if(number % 4 == 1, NULL, 43::Dynamic)) AS res
FROM numbers(10);

SELECT coalesce(if(number % 2, NULL, number::Dynamic), if(number % 3, NULL, 42::Dynamic), if(number % 4 == 1, NULL, 43)) AS res
FROM numbers(10);

SELECT coalesce(if(number % 2, NULL, number), if(number % 3, NULL, 42::Dynamic), if(number % 4 == 1, NULL, 43::Dynamic)) AS res
FROM numbers(10);

SELECT coalesce(if(number % 2, NULL, number::Dynamic), if(number % 3, NULL, 42), if(number % 4 == 1, NULL, 43::Dynamic)) AS res
FROM numbers(10);

SELECT coalesce(if(number % 2, NULL, number::Dynamic), if(number % 3, NULL, 42::Dynamic), if(number % 4 == 1, NULL, 43::Dynamic)) AS res
FROM numbers(10);