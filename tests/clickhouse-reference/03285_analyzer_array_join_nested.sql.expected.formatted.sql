SELECT
    nested(['click', 'house'], x.b.`first`, x.b.second) AS n,
    toTypeName(n)
FROM tab;

SELECT
    nested([['click', 'house']], x.b.`first`, x.b.second) AS n,
    toTypeName(n)
FROM tab;

SELECT
    nested([['click'], ['house']], x.b.`first`, x.b.second) AS n,
    toTypeName(n)
FROM tab;

SELECT x
FROM tab;

SELECT
    y,
    y.b.`first`,
    y.b.second
FROM
    tab
ARRAY JOIN x AS y;