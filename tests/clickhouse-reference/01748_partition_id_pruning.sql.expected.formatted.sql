SELECT *
FROM x
WHERE _partition_id = partitionID(1);

SELECT *
FROM x
WHERE _partition_id IN (
        SELECT partitionID(number + 1)
        FROM numbers(1)
    );

SELECT count()
FROM x
WHERE _partition_id IN (
        SELECT partitionID(number + 1)
        FROM numbers(1)
    );

SELECT *
FROM mt
WHERE toUInt64(substr(_part, 1, position(_part, '_') - 1)) = 1;