SELECT count(), sum(d) FROM src;
SELECT count(), sum(d) FROM dst;
SELECT (max(m) - min(m) > 1) AS new_block_is_generated FROM test_block_numbers;
SELECT count(), sum(d), uniqExact(_part) FROM dst;
