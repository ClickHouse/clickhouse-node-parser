SELECT
    dynamicType(d),
    d
FROM t
ORDER BY
    substring(dynamicType(d), 1, 1) ASC,
    length(dynamicType(d)) ASC,
    d ASC;

SELECT
    dynamicType(d),
    d
FROM t2
ORDER BY
    substring(dynamicType(d), 1, 1) ASC,
    length(dynamicType(d)) ASC,
    d ASC;

SELECT uniqExact(dynamicType(d)) AS t_
FROM t;

SELECT uniqExact(dynamicType(d)) AS t_
FROM t2;