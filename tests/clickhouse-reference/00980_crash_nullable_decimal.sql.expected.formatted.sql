SELECT arrayReduce('median', [toDecimal32OrNull('1', 2)]);

SELECT arrayReduce('median', [toDecimal64OrNull('1', 2)]);

SELECT arrayReduce('median', [toDecimal128OrZero('1', 2)]);

SELECT arrayReduce('sum', [toDecimal128OrNull('1', 2)]);

SELECT arrayReduce('median', [toDecimal128OrNull('1', 2)]);

SELECT arrayReduce('quantile(0.2)', [toDecimal128OrNull('1', 2)]);

SELECT arrayReduce('medianExact', [toDecimal128OrNull('1', 2)]);