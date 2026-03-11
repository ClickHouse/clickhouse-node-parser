SELECT count()
FROM `system`.numbers;

SELECT count()
FROM numbers(2000000);

SELECT max(t) - min(t) >= 1
FROM times;