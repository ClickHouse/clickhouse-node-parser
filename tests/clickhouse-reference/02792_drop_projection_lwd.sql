SET mutations_sync = 2;
CREATE TABLE t_projections_lwd (a UInt32, b UInt32, PROJECTION p (SELECT * ORDER BY b)) ENGINE = MergeTree ORDER BY a;
SELECT count() FROM t_projections_lwd;
