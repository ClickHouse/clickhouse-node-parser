SELECT arraySort(groupArrayIntersect(*)) FROM test_numbers__fuzz_29 GROUP BY a WITH ROLLUP ORDER BY ALL;
