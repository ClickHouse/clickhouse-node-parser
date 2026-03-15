CREATE TABLE with_nullable
( timestamp UInt32,
  country LowCardinality(Nullable(String)) ) ENGINE = MergeTree ORDER BY tuple();
CREATE TABLE  without_nullable
( timestamp UInt32,
  country LowCardinality(String)) ENGINE = MergeTree ORDER BY tuple();
select if(t0.country is null ,t2.country,t0.country) "country"
from without_nullable t0 right outer join with_nullable t2 on t0.country=t2.country
ORDER BY 1 DESC;
