CREATE TABLE t_subcolumns_local (arr Array(UInt32), n Nullable(String), t Tuple(s1 String, s2 String))
ENGINE = MergeTree ORDER BY tuple();
CREATE TABLE t_subcolumns_dist AS t_subcolumns_local ENGINE = Distributed(test_cluster_two_shards, currentDatabase(), t_subcolumns_local);
SELECT arr.size0, n.null, t.s1, t.s2 FROM t_subcolumns_dist;
-- StripeLog doesn't support subcolumns.
CREATE TABLE t_subcolumns_local (arr Array(UInt32), n Nullable(String), t Tuple(s1 String, s2 String)) ENGINE = StripeLog;
SELECT arr.size0, n.null, t.s1, t.s2 FROM t_subcolumns_dist SETTINGS enable_analyzer=1;
SELECT arr.size0, n.null, t.s1, t.s2 FROM t_subcolumns_dist SETTINGS enable_analyzer=0; -- {serverError UNKNOWN_IDENTIFIER}
