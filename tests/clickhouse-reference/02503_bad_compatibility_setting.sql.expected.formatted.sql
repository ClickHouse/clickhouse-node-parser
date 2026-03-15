SET compatibility = 'a.a'; -- { serverError BAD_ARGUMENTS }

SELECT
    value,
    changed
FROM `system`.`settings`
WHERE name = 'compatibility';