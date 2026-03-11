SELECT key, arrayJoin(val) as res FROM test ORDER BY ALL settings max_threads = 1, read_in_order_two_level_merge_threshold = 0 format Null;
