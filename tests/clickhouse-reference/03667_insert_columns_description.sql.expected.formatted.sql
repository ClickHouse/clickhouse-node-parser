SELECT '-- remote table function columns description';

SELECT *
FROM t0
ORDER BY `ALL` ASC;

SELECT *
FROM file(concat(database(), '_test.csv'))
ORDER BY `ALL` ASC;