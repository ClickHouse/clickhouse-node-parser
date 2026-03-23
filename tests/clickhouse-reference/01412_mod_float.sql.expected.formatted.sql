WITH 8.5 AS a,

2.5 AS b

SELECT
    a % b,
    negate(a) % b,
    a % negate(b),
    negate(a) % negate(b);

WITH 10.125 AS a,

2.5 AS b

SELECT
    a % b,
    negate(a) % b,
    a % negate(b),
    negate(a) % negate(b);

WITH 8.5 AS a,

2.5 AS b

SELECT
    mod(a, b),
    MOD(negate(a), b),
    modulo(a, negate(b)),
    moduloOrZero(negate(a), negate(b));

WITH 8.5 AS a,

2.5 AS b

SELECT
    a MOD b,
    negate(a) MOD b,
    a MOD negate(b),
    negate(a) MOD negate(b);

WITH 10.125 AS a,

2.5 AS b

SELECT
    a MOD b,
    negate(a) MOD b,
    a MOD negate(b),
    negate(a) MOD negate(b);

SELECT 3.5 % 0;

SELECT 3.5 MOD 0;