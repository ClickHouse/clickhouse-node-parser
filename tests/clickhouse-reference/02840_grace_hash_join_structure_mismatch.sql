set allow_suspicious_low_cardinality_types = 1;
CREATE TABLE t1__fuzz_17 (`a` LowCardinality(UInt8), `b` Nullable(UInt256)) ENGINE = Memory;
CREATE TABLE t2__fuzz_0 (`c` UInt32, `d` String) ENGINE = Memory;
set join_algorithm='grace_hash';
SELECT * FROM t1__fuzz_17 INNER JOIN t2__fuzz_0 ON c = a WHERE a format Null;
