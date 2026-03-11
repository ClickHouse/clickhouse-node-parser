SELECT *
FROM insub
WHERE i IN (
        SELECT toInt32(3)
        FROM numbers(10)
    );