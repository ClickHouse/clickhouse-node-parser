SELECT column, serialization_kind FROM system.parts_columns
WHERE database = currentDatabase() AND table = 't_sparse_columns_clear' AND active
ORDER BY column;
SELECT count(), groupArray(message) FROM system.text_log WHERE logger_name LIKE '%' || currentDatabase() || '.t_sparse_columns_clear' || '%' AND level = 'Error';
