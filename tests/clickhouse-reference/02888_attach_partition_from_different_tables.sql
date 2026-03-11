SELECT * FROM attach_partition_t6 WHERE b = '1';
SELECT b, sum(a) FROM attach_partition_t6 GROUP BY b ORDER BY b;
