CREATE TABLE t0 (c0 Int16, projection h (SELECT min(c0), max(c0), count() GROUP BY -c0)) ENGINE = MergeTree ORDER BY ();
SELECT count() FROM t0 GROUP BY gcd(-sign(c0), -c0) SETTINGS optimize_use_implicit_projections = 1;
create table t1 (c0 Int32) engine = MergeTree order by sin(c0);
select c0 from t1 order by sin(-c0) settings optimize_read_in_order=0;
select c0 from t1 order by sin(-c0) settings optimize_read_in_order=1;
