SET enable_json_type = 1, max_insert_threads = 20, max_threads = 20, min_insert_block_size_rows = 65536;
CREATE TABLE t_json_parallel (data JSON) ENGINE = MergeTree ORDER BY tuple();
SELECT groupUniqArrayMap(JSONAllPathsWithTypes(data)), count() FROM t_json_parallel;
