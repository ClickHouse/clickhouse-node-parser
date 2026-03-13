SELECT
    id,
    v
FROM t_lightweight_mut_5
ORDER BY id ASC;

SELECT command
FROM `system`.mutations
WHERE database = currentDatabase()
    AND table = 't_lightweight_mut_5'
    AND NOT is_done
ORDER BY command ASC;

SELECT
    id,
    length(v)
FROM t_lightweight_mut_5
ORDER BY id ASC; -- { serverError BAD_ARGUMENTS }

SELECT
    id,
    finalizeAggregation(v)
FROM t_lightweight_mut_5
ORDER BY id ASC;

SELECT
    id,
    and(greaterOrEquals(v, now() - toIntervalMinute(10)), lessOrEquals(v, now()))
FROM t_lightweight_mut_5;

SELECT replaceRegexpOne(command, '(\\d{10})', 'timestamp')
FROM `system`.mutations
WHERE database = currentDatabase()
    AND table = 't_lightweight_mut_5'
    AND NOT is_done
ORDER BY command ASC;

SELECT *
FROM t_lightweight_mut_5
ORDER BY id ASC; -- { serverError BAD_ARGUMENTS }

SELECT *
FROM t_lightweight_mut_5
ORDER BY id ASC
SETTINGS apply_mutations_on_fly = 0;

SELECT *
FROM t_lightweight_mut_5
ORDER BY id ASC
SETTINGS apply_mutations_on_fly = 1;