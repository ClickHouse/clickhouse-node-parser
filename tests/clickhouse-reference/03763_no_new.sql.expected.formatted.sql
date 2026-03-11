SELECT throwIf(name != '', 'No settings can be named "new"')
FROM `system`.`settings`
WHERE like(name, '%new\\_%')
    AND notLike(name, '%new\\_file%')
    AND name NOT IN (
        SELECT alias_for
        FROM `system`.`settings`
        WHERE notLike(name, '%new\\_%')
    );

SELECT throwIf(name != '', 'No settings can be named "new"')
FROM `system`.merge_tree_settings
WHERE like(name, '%new\\_%')
    AND notLike(name, '%new\\_file%');

SELECT throwIf(name != '', 'No settings can be named "new"')
FROM `system`.server_settings
WHERE like(name, '%new\\_%')
    AND notLike(name, '%new\\_file%');