SELECT
    id,
    v
FROM t_mutations_nondeterministic
ORDER BY id ASC;

SELECT command
FROM `system`.mutations
WHERE database = currentDatabase()
    AND table = 't_mutations_nondeterministic'
    AND is_done
ORDER BY command ASC;

SELECT
    id,
    finalizeAggregation(v)
FROM t_mutations_nondeterministic
ORDER BY id ASC;

SELECT
    id,
    and(greaterOrEquals(v, now() - toIntervalMinute(10)), lessOrEquals(v, now()))
FROM t_mutations_nondeterministic;

SELECT replaceRegexpOne(command, '(\\d{10})', 'timestamp')
FROM `system`.mutations
WHERE database = currentDatabase()
    AND table = 't_mutations_nondeterministic'
    AND is_done
ORDER BY command ASC;

SELECT replaceRegexpOne(command, '(\\d{10})', 'timestamp')
FROM `system`.mutations
WHERE database = currentDatabase()
    AND table = 't_mutations_nondeterministic'
    AND NOT is_done
ORDER BY command ASC;

SELECT
    id,
    d
FROM t_mutations_nondeterministic
ORDER BY id ASC;