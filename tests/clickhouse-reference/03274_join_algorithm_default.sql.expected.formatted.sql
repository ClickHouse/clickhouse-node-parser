-- Test that with default join_algorithm setting, we are doing a parallel hash join
SELECT value == 'direct,parallel_hash,hash'
FROM `system`.`settings`
WHERE name = 'join_algorithm';

SELECT value == 'default'
FROM `system`.`settings`
WHERE name = 'join_algorithm';