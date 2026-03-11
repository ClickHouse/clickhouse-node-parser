SELECT dynamicType(d2)
FROM test
GROUP BY dynamicType(d2)
HAVING 0
    OR ((materialize(toLowCardinality(0)) = 0) = anyLast(1))
ORDER BY 1 ASC;

SELECT dynamicType(d2)
FROM test
GROUP BY dynamicType(d2)
HAVING 0
    OR ((materialize(toLowCardinality(0)) = 0) = anyLast(0))
ORDER BY 1 ASC;