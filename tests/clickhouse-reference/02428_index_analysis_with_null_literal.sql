select count() from test where a = (select toUInt64(1) where 1 = 2) settings enable_early_constant_folding = 0, force_primary_key = 1;
select count() from test_null_filter where key = null and value > 0 settings force_primary_key = 1;
