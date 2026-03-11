SELECT *
FROM bf_tokenbf_map_keys_test
WHERE map['K0'] = 'V0'
SETTINGS force_data_skipping_indices = 'map_keys_tokenbf';

SELECT *
FROM bf_tokenbf_map_keys_test
WHERE map['K2'] = 'V2'
SETTINGS force_data_skipping_indices = 'map_keys_tokenbf';

SELECT *
FROM bf_tokenbf_map_keys_test
WHERE map['K3'] = '';

SELECT *
FROM bf_tokenbf_map_keys_test
WHERE map['K0'] != 'V0'
SETTINGS force_data_skipping_indices = 'map_keys_tokenbf';

SELECT *
FROM bf_tokenbf_map_keys_test
WHERE map['K2'] != 'V2'
SETTINGS force_data_skipping_indices = 'map_keys_tokenbf';

SELECT *
FROM bf_tokenbf_map_keys_test
WHERE map['K3'] != '';

SELECT *
FROM bf_tokenbf_map_keys_test
WHERE map_fixed['K0'] = 'V0'
SETTINGS force_data_skipping_indices = 'map_fixed_keys_tokenbf';

SELECT *
FROM bf_tokenbf_map_keys_test
WHERE map_fixed['K2'] = 'V2'
SETTINGS force_data_skipping_indices = 'map_fixed_keys_tokenbf';

SELECT *
FROM bf_tokenbf_map_keys_test
WHERE map_fixed['K3'] = '';

SELECT *
FROM bf_tokenbf_map_keys_test
WHERE map_fixed['K0'] != 'V0'
SETTINGS force_data_skipping_indices = 'map_fixed_keys_tokenbf';

SELECT *
FROM bf_tokenbf_map_keys_test
WHERE map_fixed['K2'] != 'V2'
SETTINGS force_data_skipping_indices = 'map_fixed_keys_tokenbf';

SELECT *
FROM bf_tokenbf_map_keys_test
WHERE map_fixed['K3'] != '';

SELECT *
FROM bf_tokenbf_map_values_test
WHERE map['K0'] = 'V0'
SETTINGS force_data_skipping_indices = 'map_values_tokenbf';

SELECT *
FROM bf_tokenbf_map_values_test
WHERE map['K2'] = 'V2'
SETTINGS force_data_skipping_indices = 'map_values_tokenbf';

SELECT *
FROM bf_tokenbf_map_values_test
WHERE map['K3'] = '';

SELECT *
FROM bf_tokenbf_map_values_test
WHERE map['K0'] != 'V0'
SETTINGS force_data_skipping_indices = 'map_values_tokenbf';

SELECT *
FROM bf_tokenbf_map_values_test
WHERE map['K2'] != 'V2'
SETTINGS force_data_skipping_indices = 'map_values_tokenbf';

SELECT *
FROM bf_tokenbf_map_values_test
WHERE map['K3'] != '';

SELECT *
FROM bf_tokenbf_map_values_test
WHERE mapContainsValueLike(map, 'V0')
SETTINGS force_data_skipping_indices = 'map_values_tokenbf';

SELECT *
FROM bf_tokenbf_map_values_test
WHERE mapContainsValueLike(map, 'V2')
SETTINGS force_data_skipping_indices = 'map_values_tokenbf';

SELECT *
FROM bf_tokenbf_map_values_test
WHERE NOT mapContainsValueLike(map, 'V0')
SETTINGS force_data_skipping_indices = 'map_values_tokenbf';

SELECT *
FROM bf_tokenbf_map_values_test
WHERE NOT mapContainsValueLike(map, 'V2')
SETTINGS force_data_skipping_indices = 'map_values_tokenbf';

SELECT *
FROM bf_tokenbf_map_values_test
WHERE map_fixed['K0'] = 'V0'
SETTINGS force_data_skipping_indices = 'map_fixed_values_tokenbf';

SELECT *
FROM bf_tokenbf_map_values_test
WHERE map_fixed['K2'] = 'V2'
SETTINGS force_data_skipping_indices = 'map_fixed_values_tokenbf';

SELECT *
FROM bf_tokenbf_map_values_test
WHERE map_fixed['K3'] = '';

SELECT *
FROM bf_tokenbf_map_values_test
WHERE map_fixed['K0'] != 'V0'
SETTINGS force_data_skipping_indices = 'map_fixed_values_tokenbf';

SELECT *
FROM bf_tokenbf_map_values_test
WHERE map_fixed['K2'] != 'V2'
SETTINGS force_data_skipping_indices = 'map_fixed_values_tokenbf';

SELECT *
FROM bf_tokenbf_map_values_test
WHERE map_fixed['K3'] != '';

SELECT *
FROM bf_tokenbf_map_values_test
WHERE mapContainsValueLike(map_fixed, 'V0%')
SETTINGS force_data_skipping_indices = 'map_fixed_values_tokenbf';

SELECT *
FROM bf_tokenbf_map_values_test
WHERE mapContainsValueLike(map_fixed, 'V2%')
SETTINGS force_data_skipping_indices = 'map_fixed_values_tokenbf';

SELECT *
FROM bf_tokenbf_map_values_test
WHERE NOT mapContainsValueLike(map_fixed, 'V0%')
SETTINGS force_data_skipping_indices = 'map_fixed_values_tokenbf';

SELECT *
FROM bf_tokenbf_map_values_test
WHERE NOT mapContainsValueLike(map_fixed, 'V2%')
SETTINGS force_data_skipping_indices = 'map_fixed_values_tokenbf';

SELECT *
FROM bf_ngrambf_map_keys_test
WHERE map['K0'] = 'V0'
SETTINGS force_data_skipping_indices = 'map_keys_ngrambf';

SELECT *
FROM bf_ngrambf_map_keys_test
WHERE map['K2'] = 'V2'
SETTINGS force_data_skipping_indices = 'map_keys_ngrambf';

SELECT *
FROM bf_ngrambf_map_keys_test
WHERE map['K3'] = '';

SELECT *
FROM bf_ngrambf_map_keys_test
WHERE map['K0'] != 'V0'
SETTINGS force_data_skipping_indices = 'map_keys_ngrambf';

SELECT *
FROM bf_ngrambf_map_keys_test
WHERE map['K2'] != 'V2'
SETTINGS force_data_skipping_indices = 'map_keys_ngrambf';

SELECT *
FROM bf_ngrambf_map_keys_test
WHERE map['K3'] != '';

SELECT *
FROM bf_ngrambf_map_keys_test
WHERE map_fixed['K0'] = 'V0'
SETTINGS force_data_skipping_indices = 'map_fixed_keys_ngrambf';

SELECT *
FROM bf_ngrambf_map_keys_test
WHERE map_fixed['K2'] = 'V2'
SETTINGS force_data_skipping_indices = 'map_fixed_keys_ngrambf';

SELECT *
FROM bf_ngrambf_map_keys_test
WHERE map_fixed['K3'] = '';

SELECT *
FROM bf_ngrambf_map_keys_test
WHERE map_fixed['K0'] != 'V0'
SETTINGS force_data_skipping_indices = 'map_fixed_keys_ngrambf';

SELECT *
FROM bf_ngrambf_map_keys_test
WHERE map_fixed['K2'] != 'V2'
SETTINGS force_data_skipping_indices = 'map_fixed_keys_ngrambf';

SELECT *
FROM bf_ngrambf_map_keys_test
WHERE map_fixed['K3'] != '';

SELECT *
FROM bf_ngrambf_map_values_test
WHERE map['K0'] = 'V0'
SETTINGS force_data_skipping_indices = 'map_values_ngrambf';

SELECT *
FROM bf_ngrambf_map_values_test
WHERE map['K2'] = 'V2'
SETTINGS force_data_skipping_indices = 'map_values_ngrambf';

SELECT *
FROM bf_ngrambf_map_values_test
WHERE map['K3'] = '';

SELECT *
FROM bf_ngrambf_map_values_test
WHERE map['K0'] != 'V0'
SETTINGS force_data_skipping_indices = 'map_values_ngrambf';

SELECT *
FROM bf_ngrambf_map_values_test
WHERE map['K2'] != 'V2'
SETTINGS force_data_skipping_indices = 'map_values_ngrambf';

SELECT *
FROM bf_ngrambf_map_values_test
WHERE map['K3'] != '';

SELECT *
FROM bf_ngrambf_map_values_test
WHERE map_fixed['K0'] = 'V0'
SETTINGS force_data_skipping_indices = 'map_fixed_values_ngrambf';

SELECT *
FROM bf_ngrambf_map_values_test
WHERE map_fixed['K2'] = 'V2'
SETTINGS force_data_skipping_indices = 'map_fixed_values_ngrambf';

SELECT *
FROM bf_ngrambf_map_values_test
WHERE map_fixed['K3'] = '';

SELECT *
FROM bf_ngrambf_map_values_test
WHERE map_fixed['K0'] != 'V0'
SETTINGS force_data_skipping_indices = 'map_fixed_values_ngrambf';

SELECT *
FROM bf_ngrambf_map_values_test
WHERE map_fixed['K2'] != 'V2'
SETTINGS force_data_skipping_indices = 'map_fixed_values_ngrambf';

SELECT *
FROM bf_ngrambf_map_values_test
WHERE map_fixed['K3'] != '';