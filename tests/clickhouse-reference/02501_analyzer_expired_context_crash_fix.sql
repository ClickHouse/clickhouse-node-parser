SELECT b, a, JSONLength(grp_aggreg, 100, NULL) FROM test_table SETTINGS optimize_aggregation_in_order = 1;
