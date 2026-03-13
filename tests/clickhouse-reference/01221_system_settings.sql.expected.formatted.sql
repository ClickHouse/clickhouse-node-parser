-- Tags: no-object-storage
SELECT *
FROM `system`.`settings`
WHERE name = 'send_timeout';

SELECT *
FROM `system`.merge_tree_settings
WHERE name = 'index_granularity';