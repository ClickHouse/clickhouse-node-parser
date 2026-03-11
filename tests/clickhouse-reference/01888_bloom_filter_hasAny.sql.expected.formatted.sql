SELECT count()
FROM bftest
WHERE hasAny(x, materialize([1,2,3]))
FORMAT Null;

SELECT count()
FROM bftest
WHERE hasAny(y, [NULL,-42])
FORMAT Null;

SELECT count()
FROM bftest
WHERE hasAny(y, [0,NULL])
FORMAT Null;

SELECT count()
FROM bftest
WHERE hasAny(y, [[123], -42])
FORMAT Null;

SELECT count()
FROM bftest
WHERE hasAny(y, [toDecimal32(123, 3), 2])
FORMAT Null;

SELECT count()
FROM bftest
WHERE has(x, 42)
    OR has(x, -42)
FORMAT Null;

SELECT count()
FROM bftest
WHERE hasAny(x, [42,-42])
FORMAT Null;

SELECT count()
FROM bftest
WHERE hasAny(x, [])
FORMAT Null;

SELECT count()
FROM bftest
WHERE hasAny(x, [1])
FORMAT Null;

SELECT count()
FROM bftest
WHERE hasAny(x, [1,2,k])
FORMAT Null;

SELECT count()
FROM bftest
WHERE hasAny(x, [NULL,-42])
FORMAT Null;

SELECT count()
FROM bftest
WHERE hasAny(x, [0,NULL])
FORMAT Null;

SELECT count()
FROM bftest
WHERE hasAny(x, [[123], -42])
FORMAT Null;

SELECT count()
FROM bftest
WHERE hasAny(x, [toDecimal32(123, 3), 2])
FORMAT Null;

SELECT 1
FROM bftest
WHERE has(x, -0.)
    OR 0.
FORMAT Null;

SELECT count()
FROM bftest
WHERE hasAny(x, [0, 1])
    OR 0.
FORMAT Null;