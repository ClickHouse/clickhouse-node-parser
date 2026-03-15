set allow_suspicious_low_cardinality_types=1;
create table lc_lambda (arr Array(LowCardinality(UInt64))) engine = Memory;
select arrayFilter(x -> x % 2 == 0, arr) from lc_lambda;
CREATE TABLE test_array(resources_host Array(LowCardinality(String))) ENGINE = MergeTree() ORDER BY (resources_host);
SELECT arrayMap(i -> [resources_host[i]], arrayEnumerate(resources_host)) FROM test_array;
SELECT arrayMap(x -> (x + (arrayMap(y -> ((x + y) + toLowCardinality(1)), [])[1])), []);
