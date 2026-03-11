SELECT count()
FROM t_skip_index_disj_oob
WHERE (a = 1
    AND b = 1)
    OR (a = 2
    AND b = 2)
    OR (a = 3
    AND b = 3)
    OR (a = 4
    AND b = 4)
    OR (a = 5
    AND b = 5)
    OR (a = 6
    AND b = 6)
    OR (a = 7
    AND b = 7)
    OR (a = 8
    AND b = 8)
    OR (a = 9
    AND b = 9)
SETTINGS
    use_primary_key = 0,
    use_skip_indexes_on_data_read = 0,
    use_skip_indexes_for_disjunctions = 1,
    use_query_condition_cache = 0,
    optimize_min_equality_disjunction_chain_length = 100;