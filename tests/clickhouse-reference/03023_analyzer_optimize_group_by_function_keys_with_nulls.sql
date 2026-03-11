SELECT ignore(toLowCardinality(number)) FROM numbers(10) GROUP BY GROUPING SETS ((ignore(toLowCardinality(number)), toLowCardinality(number)));
