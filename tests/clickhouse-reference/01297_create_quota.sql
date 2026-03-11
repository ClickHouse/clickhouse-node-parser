SELECT '-- default';
SELECT name, storage, keys, durations, apply_to_all, apply_to_list, apply_to_except FROM system.quotas WHERE name LIKE 'q%\_01297' ORDER BY name;
SELECT * FROM system.quota_limits WHERE quota_name LIKE 'q%\_01297' ORDER BY quota_name, duration;
