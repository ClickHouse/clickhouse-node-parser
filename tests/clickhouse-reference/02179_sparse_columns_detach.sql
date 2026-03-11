SELECT count() FROM t_sparse_detach WHERE s != '';
SELECT column, serialization_kind FROM system.parts_columns
WHERE table = 't_sparse_detach' AND database = currentDatabase() AND active
ORDER BY column;
