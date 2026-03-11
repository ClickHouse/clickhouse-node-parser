SELECT
    key,
    arrayJoin(val) AS res
FROM test
ORDER BY `ALL` ASC
SETTINGS
    max_threads = 1,
    read_in_order_two_level_merge_threshold = 0
FORMAT Null;