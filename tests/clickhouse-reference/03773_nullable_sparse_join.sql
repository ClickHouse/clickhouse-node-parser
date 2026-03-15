SET max_partitions_per_insert_block=99999999;
SET compatibility='23.3';
CREATE TABLE t1 (`c1` String, `c3` String, `c2` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(c2) ORDER BY c1;
CREATE TABLE t2 (`c4` Int64) ENGINE = MergeTree ORDER BY c4;
SELECT lo.c4 FROM t1 AS l INNER JOIN t2 AS lo ON toInt64OrNull(l.c3) = lo.c4 FORMAT NULL;
