SELECT COUNT() FROM bloom_filter_null_array;
SELECT COUNT() FROM bloom_filter_null_array WHERE has(v, 0);
SELECT COUNT() FROM bloom_filter_null_array WHERE not has(v, 0);
