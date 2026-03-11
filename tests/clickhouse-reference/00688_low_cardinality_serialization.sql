select toTypeName(dict), dict, lowCardinalityIndices(dict), lowCardinalityKeys(dict) from (select '123_' || toLowCardinality(v) as dict from (select arrayJoin(['a', 'bb', '', 'a', 'ccc', 'a', 'bb', '', 'dddd']) as v));
select toTypeName(dict), dict, lowCardinalityIndices(dict), lowCardinalityKeys(dict) from (select '123_' || toLowCardinality(v) as dict from (select arrayJoin(['a', Null, 'bb', '', 'a', Null, 'ccc', 'a', 'bb', '', 'dddd']) as v));
select sum(toUInt64OrZero(str)) from lc_small_dict;
select sum(toUInt64OrZero(str)) from lc_big_dict;
