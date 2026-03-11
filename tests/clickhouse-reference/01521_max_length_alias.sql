SELECT count(), min(length(c.d)) AS minExpr, min(dcount) AS minAlias,
    max(length(c.d)) AS maxExpr, max(dcount) AS maxAlias, b
FROM max_length_alias_14053 GROUP BY b;
