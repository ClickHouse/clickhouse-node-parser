SELECT count() FROM t_set_index_dynamic WHERE indexHint(v);
SELECT count() FROM t_set_index_dynamic WHERE indexHint(indexHint(*));
SELECT count() FROM t_set_index_dynamic PREWHERE indexHint(indexHint(*)) WHERE indexHint(indexHint(*));
