SELECT
    1::BFloat16,
    -1::BFloat16,
    1.1::BFloat16,
    -1.1::BFloat16,
    CAST(1 AS BFloat16),
    CAST(-1 AS BFloat16),
    CAST(1.1 AS BFloat16),
    CAST(-1.1 AS BFloat16),
    CAST(0xFFFFFFFFFFFFFFFF AS BFloat16),
    CAST(-0.0 AS BFloat16),
    CAST(inf AS BFloat16),
    CAST(-inf AS BFloat16),
    CAST(nan AS BFloat16);

SELECT
    CAST(1.1::BFloat16 AS BFloat16),
    CAST(1.1::BFloat16 AS Float32),
    CAST(1.1::BFloat16 AS Float64),
    CAST(1.1::BFloat16 AS Int8);

SELECT
    1.1::BFloat16 = 1.1::BFloat16,
    1.1::BFloat16 < 1.1,
    1.1::BFloat16 > 1.1,
    1.1::BFloat16 > 1,
    1.1::BFloat16 = 1.09375;

SELECT
    1.1::BFloat16 - 1.1::BFloat16 AS a,
    1.1::BFloat16 + 1.1::BFloat16 AS b,
    1.1::BFloat16 * 1.1::BFloat16 AS c,
    1.1::BFloat16 / 1.1::BFloat16 AS d,
    toTypeName(a),
    toTypeName(b),
    toTypeName(c),
    toTypeName(d);

SELECT
    1.1::BFloat16 - 1.1 AS a,
    1.1 + 1.1::BFloat16 AS b,
    1.1::BFloat16 * 1.1 AS c,
    1.1 / 1.1::BFloat16 AS d,
    toTypeName(a),
    toTypeName(b),
    toTypeName(c),
    toTypeName(d);

SELECT
    *,
    n = x,
    n - x
FROM t
WHERE n % 1000 = 0
ORDER BY n ASC;

SELECT
    sum(n),
    sum(x),
    avg(n),
    avg(x),
    min(n),
    min(x),
    max(n),
    max(x),
    uniq(n),
    uniq(x),
    uniqExact(n),
    uniqExact(x)
FROM t;

SELECT
    1.1::BFloat16 AS x,
    hex(x),
    bin(x),
    byteSize(x),
    reinterpretAsUInt16(x),
    hex(reinterpretAsString(x));

SELECT
    1.1::BFloat16 AS x,
    round(x),
    round(x, 1),
    round(x, 2),
    round(x, -1);