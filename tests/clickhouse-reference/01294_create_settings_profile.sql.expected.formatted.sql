SELECT '-- default';

SELECT
    name,
    storage,
    num_elements,
    apply_to_all,
    apply_to_list,
    apply_to_except
FROM `system`.settings_profiles
WHERE like(name, 's%\\_01294')
ORDER BY name ASC;

SELECT *
FROM `system`.settings_profile_elements
WHERE like(profile_name, 's%\\_01294')
ORDER BY
    profile_name ASC,
    index ASC;