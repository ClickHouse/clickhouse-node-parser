SET mutations_sync = 2;
CREATE TABLE t_projections_lwd (a UInt32, b UInt32, PROJECTION p (SELECT * ORDER BY b)) ENGINE = MergeTree ORDER BY a;
INSERT INTO t_projections_lwd SELECT number, number FROM numbers(100);
SELECT count() FROM t_projections_lwd;
