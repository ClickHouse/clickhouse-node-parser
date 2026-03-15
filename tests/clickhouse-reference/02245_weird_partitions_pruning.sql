SELECT DISTINCT _partition_id, _partition_value FROM weird_partitions_02245 ORDER BY _partition_id ASC;
SELECT _partition_id, min(d), max(d), min(d1), max(d1), count() FROM weird_partitions_02245 GROUP BY _partition_id ORDER BY _partition_id ASC;
select  DISTINCT _partition_id from weird_partitions_02245 where d >= '2021-12-31 00:00:00' and d < '2022-01-01 00:00:00' ORDER BY _partition_id;
select  DISTINCT _partition_id from weird_partitions_02245 where d >= '2022-01-01 00:00:00' and  d1 >= '2021-12-31 00:00:00' and d1 < '2022-01-01 00:00:00' ORDER BY _partition_id;
select  DISTINCT _partition_id from weird_partitions_02245 where d1 >= '2021-12-31 00:00:00' and d1 < '2022-01-01 00:00:00' ORDER BY _partition_id;
select  DISTINCT _partition_id from weird_partitions_02245 where d >= '2022-01-01 00:00:00' and  d1 >= '2021-12-31 00:00:00' and d1 < '2020-01-01 00:00:00' ORDER BY _partition_id;
