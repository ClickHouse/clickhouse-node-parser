SELECT id, v FROM t_mutations_nondeterministic ORDER BY id;
SELECT command FROM system.mutations
WHERE database = currentDatabase() AND table = 't_mutations_nondeterministic' AND is_done
ORDER BY command;
SELECT id, finalizeAggregation(v) FROM t_mutations_nondeterministic ORDER BY id;
SELECT id, v BETWEEN now() - INTERVAL 10 MINUTE AND now() FROM t_mutations_nondeterministic;
SELECT
    replaceRegexpOne(command, '(\\d{10})', 'timestamp'),
FROM system.mutations
WHERE database = currentDatabase() AND table = 't_mutations_nondeterministic' AND is_done
ORDER BY command;
SELECT
    replaceRegexpOne(command, '(\\d{10})', 'timestamp'),
FROM system.mutations
WHERE database = currentDatabase() AND table = 't_mutations_nondeterministic' AND NOT is_done
ORDER BY command;
SELECT id, d FROM t_mutations_nondeterministic ORDER BY id;
