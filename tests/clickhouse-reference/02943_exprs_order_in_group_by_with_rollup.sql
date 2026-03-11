SELECT toString(a) as r1, b, count() FROM test_group_by_with_rollup_order GROUP BY r1, b WITH ROLLUP ORDER BY b,r1;
