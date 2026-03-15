CREATE TABLE t_sparse_pk (k UInt64, s String)
ENGINE = MergeTree ORDER BY k
SETTINGS ratio_of_defaults_for_sparse_serialization = 0.0, index_granularity = 1;
SET force_primary_key = 1;
SELECT k, s FROM t_sparse_pk WHERE k = 2 ORDER BY k, s;
SELECT k, s FROM t_sparse_pk WHERE k = 0 OR k = 3 ORDER BY k, s;
CREATE TABLE t_sparse_pk (k UInt64, v UInt64 CODEC(NONE))
ENGINE = MergeTree ORDER BY k
SETTINGS ratio_of_defaults_for_sparse_serialization = 0.0, index_granularity = 30;
CREATE TABLE t_full_pk (k UInt64, v UInt64)
ENGINE = MergeTree ORDER BY k
SETTINGS ratio_of_defaults_for_sparse_serialization = 1.1, index_granularity = 30;
SELECT count(v), sum(v) FROM t_sparse_pk WHERE k = 0;
SELECT count(v), sum(v) FROM t_full_pk WHERE k = 0;
SELECT count(v), sum(v) FROM t_sparse_pk WHERE k = 0 OR k = 3 OR k = 7 OR k = 8;
SELECT count(v), sum(v) FROM t_full_pk WHERE k = 0 OR k = 3 OR k = 7 OR k = 8;
SET force_primary_key = 0;
SELECT (k = NULL) OR (k = 1000) FROM t_sparse_pk LIMIT 3;
SELECT range(k) FROM t_sparse_pk ORDER BY k LIMIT 3;
