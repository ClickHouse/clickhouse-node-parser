create table t (i Int, a Int, s String, index ind_s (s) type set(1) granularity 1) engine = MergeTree order by i;
SELECT a, i from t ORDER BY a, i;
