SELECT
    name,
    description
FROM `system`.`settings`
WHERE substring(description, 1, 1) != upper(substring(description, 1, 1));