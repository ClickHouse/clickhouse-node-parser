SELECT column,
(SELECT d from (select [1, 2, 3, 4] as d)) as d
FROM TestTable
where column == 'test'
GROUP BY column;
