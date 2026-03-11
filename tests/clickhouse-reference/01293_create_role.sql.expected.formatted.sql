SELECT '-- default';

SELECT
    name,
    storage
FROM `system`.roles
WHERE name = 'r1_01293';

SELECT *
FROM `system`.settings_profile_elements
WHERE like(role_name, 'r%\\_01293')
ORDER BY
    role_name ASC,
    index ASC;