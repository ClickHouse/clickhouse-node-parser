SELECT '-- default';
SELECT name, storage, auth_type, auth_params, host_ip, host_names, host_names_regexp, host_names_like, default_roles_all, default_roles_list, default_roles_except FROM system.users WHERE name LIKE 'u%\_01292' ORDER BY name;
SELECT * FROM system.settings_profile_elements WHERE user_name LIKE 'u%\_01292' ORDER BY user_name, index;
SELECT name, auth_type, auth_params FROM system.users WHERE name = 'u1_01292' ORDER BY name;
SELECT query
FROM system.query_log
WHERE
    query NOT LIKE '%query_log%' AND event_date >= yesterday() AND current_database = currentDatabase() AND
    (query LIKE '%qwe123%' OR query LIKE '%123qwe%' OR
    query LIKE '%18138372FAD4B94533CD4881F03DC6C69296DD897234E0CEE83F727E2E6B1F63%' OR
    query LIKE '%8DCDD69CE7D121DE8013062AEAEB2A148910D50E%' OR
    query like '%$2a$12$rz5iy2LhuwBezsM88ZzWiemOVUeJ94xHTzwAlLMDhTzwUxOHaY64q%');
