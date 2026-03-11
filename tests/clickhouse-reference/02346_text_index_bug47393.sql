SELECT data_version FROM system.parts WHERE database = currentDatabase() AND table = 'tab' AND active = 1;
SELECT str FROM tab WHERE str LIKE '%inverted%' SETTINGS force_data_skipping_indices = 'idx';
