SELECT count()
FROM tab_v3
WHERE content = 'iii'
SETTINGS
    force_data_skipping_indices = 'idx_content_bloom',
    enable_analyzer = 0;

SELECT count()
FROM tab_v3
WHERE content = 'iii'
SETTINGS
    force_data_skipping_indices = 'idx_content_bloom',
    enable_analyzer = 1;