SELECT value == 'direct,parallel_hash,hash'
FROM `system`.`settings`
WHERE name = 'join_algorithm';

SELECT value == 'default'
FROM `system`.`settings`
WHERE name = 'join_algorithm';