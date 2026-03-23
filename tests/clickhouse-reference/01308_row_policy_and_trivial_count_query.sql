SET optimize_move_to_prewhere = 1;
CREATE TABLE t (x UInt8) ENGINE = MergeTree ORDER BY x;
INSERT INTO t VALUES (1), (2), (3);
SELECT count() FROM t;
CREATE ROW POLICY filter ON t USING (x % 2 = 1) TO ALL;
