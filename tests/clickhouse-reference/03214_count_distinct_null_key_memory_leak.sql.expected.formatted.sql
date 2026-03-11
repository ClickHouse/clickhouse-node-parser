SELECT countDistinct(b)
FROM testnull
GROUP BY a
SETTINGS max_memory_usage = 10000000;