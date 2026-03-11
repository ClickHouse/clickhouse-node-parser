SELECT bitmapToArray(bitmapTransform(bitmapBuild([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]), CAST([5,999,2] AS Array(UInt32)), CAST([2,888,20] AS Array(UInt32)))) AS res
FORMAT Null;

SELECT (max(value) - min(value)) == 0
FROM counters;