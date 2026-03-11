SELECT '-- default';
SELECT name, storage, num_elements, apply_to_all, apply_to_list, apply_to_except FROM system.settings_profiles WHERE name LIKE 's%\_01294' ORDER BY name;
SELECT * FROM system.settings_profile_elements WHERE profile_name LIKE 's%\_01294' ORDER BY profile_name, index;
