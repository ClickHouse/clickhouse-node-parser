SELECT id FROM test_table WHERE value_ipv4 IN (SELECT value_ipv4 FROM test_table);
SELECT id FROM test_table WHERE value_ipv6 IN (SELECT value_ipv6 FROM test_table);
