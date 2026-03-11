SELECT id, v1 FROM tab ORDER BY v1 DESC NULLS LAST LIMIT 0 SETTINGS use_skip_indexes_for_top_k = 1;
SELECT id, v1 FROM tab ORDER BY v1 ASC LIMIT 0 SETTINGS use_skip_indexes_for_top_k = 1;
