SELECT substr(toLowCardinality('abc'), 1 IN (1)) AS x
GROUP BY x;