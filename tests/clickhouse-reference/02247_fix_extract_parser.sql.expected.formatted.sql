WITH 'number: 1' AS year

SELECT extract(year, '\\d+');

WITH 'number: 2' AS mm

SELECT extract(mm, '\\d+');

WITH 'number: 3' AS s

SELECT extract(s, '\\d+');