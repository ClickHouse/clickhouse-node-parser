SELECT arraySort(x -> x.2, [tuple('a', 10)]) AS X FROM ttt01746 WHERE d >= toDate('2021-03-03') - 2 ORDER BY n LIMIT 1;
SELECT arraySort(x -> x.2, [tuple('a', 10)]) AS X FROM ttt01746 PREWHERE d >= toDate('2021-03-03') - 2 ORDER BY n LIMIT 1;
