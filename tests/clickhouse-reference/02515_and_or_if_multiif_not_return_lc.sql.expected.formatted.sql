SELECT toTypeName(if(toLowCardinality(number % 2), 1, 2))
FROM numbers(1);

SELECT toTypeName(multiIf(toLowCardinality(number % 2), 1, 1, 2, 3))
FROM numbers(1);

SELECT toTypeName(toLowCardinality(number % 2)
    AND 2)
FROM numbers(1);

SELECT toTypeName(toLowCardinality(number % 2)
    OR 2)
FROM numbers(1);