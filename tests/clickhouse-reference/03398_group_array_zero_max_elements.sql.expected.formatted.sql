SELECT groupArray(0::UInt64)(1);

SELECT groupArray(0::Int64)(1);

SELECT groupArray(0::UInt64)('x');

SELECT groupArray(0::Int64)('x');

SELECT groupArray(0::UInt64)(number)
FROM numbers(5);

SELECT groupArray(0::Int64)(number)
FROM numbers(5);

SELECT groupArraySorted(0::UInt64)(1);

SELECT groupArraySorted(0::Int64)(1);

SELECT groupArraySorted(0::UInt64)('x');

SELECT groupArraySorted(0::Int64)('x');

SELECT groupArraySorted(0::UInt64)(number)
FROM numbers(5);

SELECT groupArraySorted(0::Int64)(number)
FROM numbers(5);

SELECT groupArraySample(0::UInt64, 123)(1);

SELECT groupArraySample(0::Int64, 123)(1);

SELECT groupArraySample(0::UInt64, 123)('x');

SELECT groupArraySample(0::Int64, 123)('x');

SELECT groupArraySample(0::UInt64, 123)(number)
FROM numbers(5);

SELECT groupArraySample(0::Int64, 123)(number)
FROM numbers(5);

SELECT groupArrayLast(0::UInt64)(1);

SELECT groupArrayLast(0::Int64)(1);

SELECT groupArrayLast(0::UInt64)('x');

SELECT groupArrayLast(0::Int64)('x');

SELECT groupArrayLast(0::UInt64)(number)
FROM numbers(5);

SELECT groupArrayLast(0::Int64)(number)
FROM numbers(5);

SELECT groupArrayMovingSum(0::UInt64)(1);

SELECT groupArrayMovingSum(0::Int64)(1);

SELECT groupArrayMovingSum(0::UInt64)('x');

SELECT groupArrayMovingSum(0::Int64)('x');

SELECT groupArrayMovingSum(0::UInt64)(number)
FROM numbers(5);

SELECT groupArrayMovingSum(0::Int64)(number)
FROM numbers(5);

SELECT groupArrayMovingAvg(0::UInt64)(1);

SELECT groupArrayMovingAvg(0::Int64)(1);

SELECT groupArrayMovingAvg(0::UInt64)('x');

SELECT groupArrayMovingAvg(0::Int64)('x');

SELECT groupArrayMovingAvg(0::UInt64)(number)
FROM numbers(5);

SELECT groupArrayMovingAvg(0::Int64)(number)
FROM numbers(5);

SELECT groupUniqArray(0::UInt64)(1);

SELECT groupUniqArray(0::Int64)(1);

SELECT groupUniqArray(0::UInt64)('x');

SELECT groupUniqArray(0::Int64)('x');

SELECT groupUniqArray(0::UInt64)(number)
FROM numbers(5);

SELECT groupUniqArray(0::Int64)(number)
FROM numbers(5);