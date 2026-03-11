
SELECT a, b, all FROM order_by_all ORDER BY all SETTINGS enable_order_by_all = 0, allow_experimental_parallel_reading_from_replicas=0;
SELECT a, b, all FROM order_by_all ORDER BY all SETTINGS enable_order_by_all = 0, allow_experimental_parallel_reading_from_replicas=1;
