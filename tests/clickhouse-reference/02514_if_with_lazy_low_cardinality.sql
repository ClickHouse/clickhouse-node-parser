-- Tags: no-fasttest
-- no-fasttest: upper/lowerUTF8 use ICU

create table if not exists t (`arr.key` Array(LowCardinality(String)), `arr.value` Array(LowCardinality(String))) engine = Memory;
select if(true, if(lowerUTF8(arr.key) = 'a', 1, 2), 3) as x from t left array join arr;
