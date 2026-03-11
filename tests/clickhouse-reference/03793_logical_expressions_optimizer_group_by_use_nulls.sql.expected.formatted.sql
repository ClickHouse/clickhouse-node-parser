SELECT 0 = ((2 = dummy))
GROUP BY GROUPING SETS ((1))
SETTINGS group_by_use_nulls = 1;