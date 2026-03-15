create table lc_prewhere (key UInt64, val UInt64, str LowCardinality(String), s String) engine = MergeTree order by key settings index_granularity = 8192;
select sum(toUInt64(str)), sum(toUInt64(s)) from lc_prewhere prewhere val == 1;
