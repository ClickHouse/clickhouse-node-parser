SELECT sleep(1)
SETTINGS
    log_processors_profiles = true,
    log_queries = 1,
    log_queries_min_type = 'QUERY_FINISH';