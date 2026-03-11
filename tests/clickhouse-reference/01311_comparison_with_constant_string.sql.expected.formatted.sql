SELECT number = '1'
FROM numbers(3);

SELECT '---';

SELECT '1' != number
FROM numbers(3);

SELECT '1' > number
FROM numbers(3);

SELECT 1 = '257';

SELECT 1 IN (1.23, '1', 2);

SELECT 1 IN (1.23, '2', 2);

SELECT 1 = '1.0';

SELECT 1 != '257';

SELECT 1 < '257';

SELECT 1 > '257';

SELECT 1 <= '257';

SELECT 1 >= '257';

SELECT toDateTime('2020-06-13 01:02:03') = '2020-06-13T01:02:03';

SELECT 0 = '';