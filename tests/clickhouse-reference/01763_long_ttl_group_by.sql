SELECT sum(value), min(min_value), max(max_value), uniqExact(key) FROM test_ttl_group_by01763;
SELECT sum(value), min(min_value), max(max_value), uniqExact(key) FROM test_ttl_group_by01763 where key = 3 ;
SELECT sum(value), min(min_value), max(max_value), uniqExact(key) FROM test_ttl_group_by01763 where key = 3 and ts <= today() - interval 30 day ;
