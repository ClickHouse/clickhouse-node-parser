SELECT val FROM
(SELECT value AS val FROM data2013 WHERE name = 'Alice'
UNION ALL
SELECT value AS val FROM data2014 WHERE name = 'Alice')
ORDER BY val ASC;
SELECT val, name FROM
(SELECT value AS val, value AS val_1, name FROM data2013 WHERE name = 'Alice'
UNION ALL
SELECT value AS val, value, name FROM data2014 WHERE name = 'Alice')
ORDER BY val ASC;
