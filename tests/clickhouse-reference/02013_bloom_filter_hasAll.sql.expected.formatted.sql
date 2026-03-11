SELECT count()
FROM bftest
WHERE hasAll(x, materialize([1,2,3]))
FORMAT Null;

SELECT count()
FROM bftest
WHERE hasAll(y, [NULL,-42])
FORMAT Null;

SELECT count()
FROM bftest
WHERE hasAll(y, [0,NULL])
FORMAT Null;

SELECT count()
FROM bftest
WHERE hasAll(y, [[123], -42])
FORMAT Null;

SELECT count()
FROM bftest
WHERE hasAll(y, [toDecimal32(123, 3), 2])
FORMAT Null;

SELECT count()
FROM bftest
WHERE has(x, 42)
    AND has(x, -42)
FORMAT Null;

SELECT count()
FROM bftest
WHERE hasAll(x, [42,-42])
FORMAT Null;

SELECT count()
FROM bftest
WHERE hasAll(x, [])
FORMAT Null;

SELECT count()
FROM bftest
WHERE hasAll(x, [1])
FORMAT Null;

SELECT count()
FROM bftest
WHERE hasAll(x, [1,2,k])
FORMAT Null;

SELECT count()
FROM bftest
WHERE hasAll(x, [NULL,-42])
FORMAT Null;

SELECT count()
FROM bftest
WHERE hasAll(x, [0,NULL])
FORMAT Null;

SELECT count()
FROM bftest
WHERE hasAll(x, [[123], -42])
FORMAT Null;

SELECT count()
FROM bftest
WHERE hasAll(x, [toDecimal32(123, 3), 2])
FORMAT Null;

SELECT 1
FROM bftest
WHERE has(x, -0.)
    OR 0.
FORMAT Null;

SELECT count()
FROM bftest
WHERE hasAll(x, [0, 1])
    OR 0.
FORMAT Null;