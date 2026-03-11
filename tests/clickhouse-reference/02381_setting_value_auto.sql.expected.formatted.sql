SELECT
    value,
    changed,
    type
FROM `system`.`settings`
WHERE name = 'insert_quorum';