SELECT '--- int, single part';

SELECT c
FROM single_int
ORDER BY `ALL` ASC
SETTINGS extremes = 1;

SELECT c
FROM multi_int
ORDER BY `ALL` ASC
SETTINGS extremes = 1;

SELECT c
FROM single_float
ORDER BY `ALL` ASC
SETTINGS extremes = 1;

SELECT c
FROM multi_float
ORDER BY `ALL` ASC
SETTINGS extremes = 1;