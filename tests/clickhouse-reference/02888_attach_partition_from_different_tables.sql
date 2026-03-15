-- test different index type
CREATE TABLE attach_partition_t1 (
	a UInt32,
	b String,
	INDEX bf b TYPE tokenbf_v1(8192, 3, 0) GRANULARITY 1
)
ENGINE = MergeTree
ORDER BY a;
CREATE TABLE attach_partition_t2 (
	a UInt32,
	b String,
	INDEX bf b TYPE bloom_filter GRANULARITY 1
)
ENGINE = MergeTree
ORDER BY a;
-- test different projection name
CREATE TABLE attach_partition_t3 (
	a UInt32,
	b String,
  PROJECTION proj
   (
       SELECT
           b,
           sum(a)
       GROUP BY b
   )
)
ENGINE = MergeTree
ORDER BY a;
CREATE TABLE attach_partition_t4 (
	a UInt32,
	b String,
  PROJECTION differently_named_proj
   (
       SELECT
           b,
           sum(a)
       GROUP BY b
   )
)
ENGINE = MergeTree
ORDER BY a;
-- check attach with same index and projection
CREATE TABLE attach_partition_t5 (
	a UInt32,
	b String,
  PROJECTION proj
   (
       SELECT
           b,
           sum(a)
       GROUP BY b
   )
)
ENGINE = MergeTree
ORDER BY a;
CREATE TABLE attach_partition_t6 (
	a UInt32,
	b String,
  PROJECTION proj
   (
       SELECT
           b,
           sum(a)
       GROUP BY b
   )
)
ENGINE = MergeTree
ORDER BY a;
SELECT * FROM attach_partition_t6 WHERE b = '1';
SELECT b, sum(a) FROM attach_partition_t6 GROUP BY b ORDER BY b;
