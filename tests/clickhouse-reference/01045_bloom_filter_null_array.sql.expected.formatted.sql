SELECT COUNT()
FROM bloom_filter_null_array;

SELECT COUNT()
FROM bloom_filter_null_array
WHERE has(v, '1');

SELECT COUNT()
FROM bloom_filter_null_array
WHERE has(v, '2');

SELECT COUNT()
FROM bloom_filter_null_array
WHERE has(v, '3');

SELECT COUNT()
FROM bloom_filter_null_array
WHERE has(v, '4');