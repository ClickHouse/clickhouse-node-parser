create table lc_dict_reading (val UInt64, str LowCardinality(String), pat String) engine = MergeTree order by val SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';
select sum(toUInt64(str)), sum(toUInt64(pat)) from lc_dict_reading where val < 8129 or val > 8192 * 4;
