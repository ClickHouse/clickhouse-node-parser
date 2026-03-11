SELECT DISTINCT *
FROM (
        SELECT DISTINCT
            cos(sign(exp(t1.c0))),
            negate(min2(pow(t1.c0, t1.c0), intDiv(t1.c0, t1.c0))),
            t1.c0,
            t1.c0,
            erf(abs(negate(t1.c0)))
        FROM t1
        WHERE t1.c0 > 0
        UNION ALL
        SELECT DISTINCT
            cos(sign(exp(t1.c0))),
            negate(min2(pow(t1.c0, t1.c0), intDiv(t1.c0, t1.c0))),
            t1.c0,
            t1.c0,
            erf(abs(negate(t1.c0)))
        FROM t1
        WHERE NOT t1.c0 > 0
        UNION ALL
        SELECT DISTINCT
            cos(sign(exp(t1.c0))),
            negate(min2(pow(t1.c0, t1.c0), intDiv(t1.c0, t1.c0))),
            t1.c0,
            t1.c0,
            erf(abs(negate(t1.c0)))
        FROM t1
        WHERE t1.c0 > (isNull(0))
    );