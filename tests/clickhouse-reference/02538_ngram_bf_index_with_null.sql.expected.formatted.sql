SELECT *
FROM `02538_bf_ngrambf_map_values_test`
PREWHERE (map['']) = 'V2V\0V2V2V2V2V2V2'
WHERE (map[NULL]) = 'V2V\0V2V2V2V2V2V2V2V\0V2V2V2V2V2V2V2V\0V2V2V2V2V2V2V2V\0V2V2V2V2V2V2'
SETTINGS force_data_skipping_indices = 'map_values_ngrambf';