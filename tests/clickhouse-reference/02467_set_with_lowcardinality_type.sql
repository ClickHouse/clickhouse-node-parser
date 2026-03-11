SELECT * FROM bloom_filter_nullable_index__fuzz_0 WHERE str IN (SELECT value FROM nullable_string_value__fuzz_2);
SELECT * FROM bloom_filter_nullable_index__fuzz_1 WHERE str IN (SELECT value FROM nullable_string_value__fuzz_2);
