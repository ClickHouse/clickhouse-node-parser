SELECT
    count('9223372036854775806'),
    7
FROM 03031_test
PREWHERE (id = NULL) AND 1024
WHERE 0.0001
GROUP BY '0.03'
SETTINGS force_primary_key = 1, force_data_skipping_indices = 'value_1_idx, value_2_idx', enable_analyzer=0;
SELECT
    count('9223372036854775806'),
    7
FROM 03031_test
PREWHERE (id = NULL) AND 1024
WHERE 0.0001
GROUP BY '0.03'
    WITH ROLLUP
SETTINGS force_primary_key = 1, force_data_skipping_indices = 'value_1_idx, value_2_idx', enable_analyzer=1;
-- Distributed queries currently return one row with count()==0
SELECT
    count('9223372036854775806'),
    7
FROM remote('127.0.0.{1,2}', currentDatabase(), 03031_test)
PREWHERE (id = NULL) AND 1024
WHERE 0.0001
GROUP BY '0.03'
SETTINGS force_primary_key = 1, force_data_skipping_indices = 'value_1_idx, value_2_idx', enable_analyzer=0;
SELECT
    count('9223372036854775806'),
    7
FROM 03031_test
PREWHERE (id = NULL) AND 1024
WHERE 0.0001
GROUP BY '0.03'
SETTINGS force_primary_key = 1, force_data_skipping_indices = 'value_1_idx, value_2_idx', enable_analyzer=0, parallel_replicas_only_with_analyzer=0,
allow_experimental_parallel_reading_from_replicas=1, cluster_for_parallel_replicas='parallel_replicas', max_parallel_replicas=100, parallel_replicas_for_non_replicated_merge_tree=1;
