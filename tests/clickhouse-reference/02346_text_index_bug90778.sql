SELECT count() FROM tab WHERE col = 'config';
SELECT trim(explain) FROM
(
    EXPLAIN actions = 1 SELECT count() FROM tab WHERE col = 'config'
    SETTINGS use_skip_indexes_on_data_read = 1, query_plan_text_index_add_hint = 1
)
WHERE explain LIKE '%Filter column:%';
SELECT count() FROM tab WHERE hasToken(col, 'config');
SELECT trim(explain) FROM
(
    EXPLAIN actions = 1 SELECT count() FROM tab WHERE hasToken(col, 'config')
    SETTINGS use_skip_indexes_on_data_read = 1, query_plan_text_index_add_hint = 1
)
WHERE explain LIKE '%Filter column:%';
