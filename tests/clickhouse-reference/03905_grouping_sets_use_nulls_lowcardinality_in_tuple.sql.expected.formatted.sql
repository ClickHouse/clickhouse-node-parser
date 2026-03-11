SELECT tuple(toLowCardinality(1), 2) AS a
GROUP BY GROUPING SETS ((1), (isNullable(19)));