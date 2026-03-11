SELECT *
FROM bf_tokenbf_array_test
WHERE has(`array`, 'K1')
SETTINGS force_data_skipping_indices = 'array_bf_tokenbf';

SELECT *
FROM bf_tokenbf_array_test
WHERE has(`array`, 'K2')
SETTINGS force_data_skipping_indices = 'array_bf_tokenbf';

SELECT *
FROM bf_tokenbf_array_test
WHERE has(`array`, 'K3')
SETTINGS force_data_skipping_indices = 'array_bf_tokenbf';

SELECT *
FROM bf_tokenbf_array_test
WHERE has(array_fixed, 'K1')
SETTINGS force_data_skipping_indices = 'array_fixed_bf_tokenbf';

SELECT *
FROM bf_tokenbf_array_test
WHERE has(array_fixed, 'K2')
SETTINGS force_data_skipping_indices = 'array_fixed_bf_tokenbf';

SELECT *
FROM bf_tokenbf_array_test
WHERE has(array_fixed, 'K3')
SETTINGS force_data_skipping_indices = 'array_fixed_bf_tokenbf';

SELECT *
FROM bf_ngram_array_test
WHERE has(`array`, 'K1')
SETTINGS force_data_skipping_indices = 'array_ngram';

SELECT *
FROM bf_ngram_array_test
WHERE has(`array`, 'K2')
SETTINGS force_data_skipping_indices = 'array_ngram';

SELECT *
FROM bf_ngram_array_test
WHERE has(`array`, 'K3')
SETTINGS force_data_skipping_indices = 'array_ngram';

SELECT *
FROM bf_ngram_array_test
WHERE has(array_fixed, 'K1')
SETTINGS force_data_skipping_indices = 'array_fixed_ngram';

SELECT *
FROM bf_ngram_array_test
WHERE has(array_fixed, 'K2')
SETTINGS force_data_skipping_indices = 'array_fixed_ngram';

SELECT *
FROM bf_ngram_array_test
WHERE has(array_fixed, 'K3')
SETTINGS force_data_skipping_indices = 'array_fixed_ngram';