SELECT value
FROM `system`.`settings`
WHERE name = 'async_insert_use_adaptive_busy_timeout'
SETTINGS compatibility = '23.12';