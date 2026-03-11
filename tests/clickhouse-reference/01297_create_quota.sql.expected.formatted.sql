SELECT '-- default';

SELECT
    name,
    storage,
    keys,
    durations,
    apply_to_all,
    apply_to_list,
    apply_to_except
FROM `system`.quotas
WHERE like(name, 'q%\\_01297')
ORDER BY name ASC;

SELECT *
FROM `system`.quota_limits
WHERE like(quota_name, 'q%\\_01297')
ORDER BY
    quota_name ASC,
    duration ASC;