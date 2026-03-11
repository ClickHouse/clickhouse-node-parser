SELECT '10 rows, index_granularity = 8192, GRANULARITY = 1 million --> 1 granule, 1 indexed block';
SELECT '12 rows, index_granularity = 3, GRANULARITY = 2 --> 4 granules, 2 indexed block';
SELECT '-- Non-default metric, hnsw_max_connections_per_layer, hnsw_candidate_list_size_for_construction';
