select toTypeName(dict), dict, lowCardinalityIndices(dict), lowCardinalityKeys(dict) from (select '123_' || toLowCardinality(v) as dict from (select arrayJoin(['a', 'bb', '', 'a', 'ccc', 'a', 'bb', '', 'dddd']) as v));
select toTypeName(dict), dict, lowCardinalityIndices(dict), lowCardinalityKeys(dict) from (select '123_' || toLowCardinality(v) as dict from (select arrayJoin(['a', Null, 'bb', '', 'a', Null, 'ccc', 'a', 'bb', '', 'dddd']) as v));
create table lc_small_dict (str LowCardinality(String)) engine = MergeTree order by str SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';
create table lc_big_dict (str LowCardinality(String)) engine = MergeTree order by str SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';
select sum(toUInt64OrZero(str)) from lc_small_dict;
select sum(toUInt64OrZero(str)) from lc_big_dict;
