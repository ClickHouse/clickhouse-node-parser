SELECT seriesDecomposeSTL([10.1, 20.45, 40.34, 10.1, 20.45, 40.34, 10.1, 20.45, 40.34, 10.1, 20.45, 40.34, 10.1, 20.45, 40.34, 10.1, 20.45, 40.34, 10.1, 20.45, 40.34, 10.1, 20.45, 40.34], 3);

SELECT seriesDecomposeSTL([2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2], 0);

SELECT seriesDecomposeSTL(ts, period)
FROM tb2
ORDER BY period ASC;

SELECT seriesDecomposeSTL([2,2,2,2,2,2,2,2,2,2,2,2,2,2], -5);

SELECT seriesDecomposeSTL([2,2,2,2,2,2,2,2,2,2,2,2,2,2], -5.2);

SELECT seriesDecomposeSTL();

SELECT seriesDecomposeSTL([]);

SELECT seriesDecomposeSTL([1,2,3], 2);

SELECT seriesDecomposeSTL([2,2,2,3,3,3]);

SELECT seriesDecomposeSTL([2,2,2,3,3,3], 9272653446478);

SELECT seriesDecomposeSTL([2,2,2,3,3,3], 7);