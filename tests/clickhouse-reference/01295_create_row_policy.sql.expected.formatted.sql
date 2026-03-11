SELECT '-- default';

SELECT
    name,
    short_name,
    database,
    table,
    storage,
    select_filter,
    is_restrictive,
    apply_to_all,
    apply_to_list,
    apply_to_except
FROM `system`.row_policies
WHERE like(short_name, 'p%\\_01295')
ORDER BY name ASC;