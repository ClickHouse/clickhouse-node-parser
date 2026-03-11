SELECT id, v FROM t_lightweight_mut_5 ORDER BY id;
SELECT command FROM system.mutations
WHERE database = currentDatabase() AND table = 't_lightweight_mut_5' AND NOT is_done
ORDER BY command;
SELECT id, length(v) FROM t_lightweight_mut_5 ORDER BY id; -- { serverError BAD_ARGUMENTS }
SELECT id, finalizeAggregation(v) FROM t_lightweight_mut_5 ORDER BY id;
SELECT id, v BETWEEN now() - INTERVAL 10 MINUTE AND now() FROM t_lightweight_mut_5;
SELECT
    replaceRegexpOne(command, '(\\d{10})', 'timestamp'),
FROM system.mutations
WHERE database = currentDatabase() AND table = 't_lightweight_mut_5' AND NOT is_done
ORDER BY command;
SELECT * FROM t_lightweight_mut_5 ORDER BY id; -- { serverError BAD_ARGUMENTS }
SELECT * FROM t_lightweight_mut_5 ORDER BY id SETTINGS apply_mutations_on_fly = 0;
SELECT * FROM t_lightweight_mut_5 ORDER BY id SETTINGS apply_mutations_on_fly = 1;
