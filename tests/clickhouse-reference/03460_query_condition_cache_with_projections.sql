select j from t where j > 3 and i = 20 order by j settings max_threads = 1, use_query_condition_cache = 1, query_condition_cache_store_conditions_as_plaintext = 1;
select part_name from system.query_condition_cache order by part_name;
