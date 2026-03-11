SELECT 'Test with NaN, INFs and Nulls' AS test;

SELECT groupNumericIndexedVector(x, y)
FROM values('x Nullable(Int32), y Nullable(Float64)', (1, 0), (3, nan), (3, 2), (0, 0), (5, 1));

SELECT groupNumericIndexedVector(x, y)
FROM values('x Nullable(Int32), y Nullable(Float64)', (1, 0), (3, Null), (3, 2), (0, 0), (5, 1));

SELECT groupNumericIndexedVector(x, y)
FROM values('x Nullable(Int32), y Nullable(Float64)', (1, 0), (3, inf), (3, 2), (0, 0), (5, 1));

SELECT groupNumericIndexedVector(x, y)
FROM values('x Nullable(Int32), y Nullable(Float64)', (1, 0), (3, -inf), (3, 2), (0, 0), (5, 1));

SELECT 'Test for overflows' AS test;