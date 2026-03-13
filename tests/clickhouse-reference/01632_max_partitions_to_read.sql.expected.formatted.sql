SELECT *
FROM p
ORDER BY i ASC; -- { serverError TOO_MANY_PARTITIONS }

SELECT *
FROM p
ORDER BY i ASC
SETTINGS max_partitions_to_read = 2;

SELECT *
FROM p
ORDER BY i ASC
SETTINGS max_partitions_to_read = 0; -- unlimited