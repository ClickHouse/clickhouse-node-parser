create table test(a UInt64, m UInt64, d DateTime) engine MergeTree partition by toYYYYMM(d) order by (a, m, d) SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';
select count() from test where a = (select toUInt64(1) where 1 = 2) settings enable_early_constant_folding = 0, force_primary_key = 1;
create table test_null_filter(key UInt64, value UInt32) engine MergeTree order by key SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';
select count() from test_null_filter where key = null and value > 0 settings force_primary_key = 1;
