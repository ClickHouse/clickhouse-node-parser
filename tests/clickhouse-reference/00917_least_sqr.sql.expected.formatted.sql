SELECT arrayReduce('simpleLinearRegression', [1, 2, 3, 4], [100, 110, 120, 130]);

SELECT arrayReduce('simpleLinearRegression', [1, 2, 3, 4], [100, 110, 120, 131]);

SELECT arrayReduce('simpleLinearRegression', [-1, -2, -3, -4], [-100, -110, -120, -130]);

SELECT arrayReduce('simpleLinearRegression', [5, 5.1], [6, 6.1]);

SELECT arrayReduce('simpleLinearRegression', [0], [0]);

SELECT arrayReduce('simpleLinearRegression', [3, 4], [3, 3]);

SELECT arrayReduce('simpleLinearRegression', [3, 3], [3, 4]);

SELECT arrayReduce('simpleLinearRegression', emptyArrayUInt8(), emptyArrayUInt8());

SELECT arrayReduce('simpleLinearRegression', [1, 2, 3, 4], [1000000000, 1100000000, 1200000000, 1300000000]);