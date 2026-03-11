SELECT count() > 0
FROM `system`.remote_data_paths
WHERE disk_name = 's3_cache'
    AND like(local_path, '%shadow/03000_traverse_shadow_system_data_path_table_backup%')
SETTINGS traverse_shadow_remote_data_paths = 1;