SELECT *
FROM t_lightweight_mut_2; -- { serverError BAD_ARGUMENTS }

SELECT *
FROM t_lightweight_mut_2
SETTINGS apply_mutations_on_fly = 0;

SELECT count()
FROM `system`.mutations
WHERE database = currentDatabase()
    AND table = 't_lightweight_mut_2'
    AND NOT is_done
    AND NOT is_killed;