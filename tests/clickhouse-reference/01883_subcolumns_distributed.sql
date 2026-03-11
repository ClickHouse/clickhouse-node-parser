SELECT arr.size0, n.null, t.s1, t.s2 FROM t_subcolumns_dist;
SELECT arr.size0, n.null, t.s1, t.s2 FROM t_subcolumns_dist SETTINGS enable_analyzer=1;
SELECT arr.size0, n.null, t.s1, t.s2 FROM t_subcolumns_dist SETTINGS enable_analyzer=0; -- {serverError UNKNOWN_IDENTIFIER}
