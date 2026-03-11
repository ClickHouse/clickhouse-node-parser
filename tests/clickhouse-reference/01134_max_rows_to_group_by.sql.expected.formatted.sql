SELECT
    'test1',
    number
FROM `system`.numbers
GROUP BY number;

SELECT
    'test2',
    number
FROM `system`.numbers
GROUP BY number
ORDER BY number ASC;

SELECT
    'test3',
    number
FROM `system`.numbers
GROUP BY number
ORDER BY number ASC;

SELECT
    'test4',
    number
FROM numbers(1000)
GROUP BY number
ORDER BY number ASC;

SELECT
    'test5',
    number
FROM numbers(1000)
GROUP BY number
ORDER BY number ASC;