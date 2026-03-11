SELECT *
FROM alter_attach
ORDER BY x ASC;

SELECT *
FROM detach_all_no_partition
ORDER BY x ASC;

SELECT *
FROM replicated_table_detach_all1
ORDER BY id ASC;

SELECT *
FROM replicated_table_detach_all2
ORDER BY id ASC;

SELECT *
FROM partition_attach_all
ORDER BY x ASC;

SELECT *
FROM replicated_partition_attach_all
ORDER BY x ASC;