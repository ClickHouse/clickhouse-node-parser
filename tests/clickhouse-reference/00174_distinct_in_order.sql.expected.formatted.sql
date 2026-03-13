-- Tags: stateful
SELECT '-- check that distinct with and w/o optimization produce the same result';

SELECT DISTINCT *
FROM distinct_in_order
EXCEPT
SELECT *
FROM ordinary_distinct;