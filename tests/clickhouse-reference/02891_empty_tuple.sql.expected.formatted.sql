SELECT count()
FROM x;

SELECT *
FROM x
ORDER BY tuple() ASC;

SELECT tuple();

SELECT *
FROM x
ORDER BY tuple() ASC
SETTINGS max_threads = 1;