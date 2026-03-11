SELECT *
FROM p
ORDER BY i ASC;

SELECT *
FROM p
ORDER BY i ASC
SETTINGS max_partitions_to_read = 2;

SELECT *
FROM p
ORDER BY i ASC
SETTINGS max_partitions_to_read = 0;