SELECT *
FROM bf_tokenbf_lowcard_test
WHERE like(lc, 'K1')
SETTINGS force_data_skipping_indices = 'lc_bf_tokenbf';

SELECT *
FROM bf_tokenbf_lowcard_test
WHERE like(lc, 'K2')
SETTINGS force_data_skipping_indices = 'lc_bf_tokenbf';

SELECT *
FROM bf_tokenbf_lowcard_test
WHERE like(lc, 'K3')
SETTINGS force_data_skipping_indices = 'lc_bf_tokenbf';

SELECT *
FROM bf_tokenbf_lowcard_test
WHERE like(lc_fixed, 'K1ZZZZZZ')
SETTINGS force_data_skipping_indices = 'lc_fixed_bf_tokenbf';

SELECT *
FROM bf_tokenbf_lowcard_test
WHERE like(lc_fixed, 'K2ZZZZZZ')
SETTINGS force_data_skipping_indices = 'lc_fixed_bf_tokenbf';

SELECT *
FROM bf_tokenbf_lowcard_test
WHERE like(lc_fixed, 'K3ZZZZZZ')
SETTINGS force_data_skipping_indices = 'lc_fixed_bf_tokenbf';

SELECT *
FROM bf_ngram_lowcard_test
WHERE like(lc, 'K1')
SETTINGS force_data_skipping_indices = 'lc_ngram';

SELECT *
FROM bf_ngram_lowcard_test
WHERE like(lc, 'K2')
SETTINGS force_data_skipping_indices = 'lc_ngram';

SELECT *
FROM bf_ngram_lowcard_test
WHERE like(lc, 'K3')
SETTINGS force_data_skipping_indices = 'lc_ngram';

SELECT *
FROM bf_ngram_lowcard_test
WHERE like(lc_fixed, 'K1ZZZZZZ')
SETTINGS force_data_skipping_indices = 'lc_fixed_ngram';

SELECT *
FROM bf_ngram_lowcard_test
WHERE like(lc_fixed, 'K2ZZZZZZ')
SETTINGS force_data_skipping_indices = 'lc_fixed_ngram';

SELECT *
FROM bf_ngram_lowcard_test
WHERE like(lc_fixed, 'K3ZZZZZZ')
SETTINGS force_data_skipping_indices = 'lc_fixed_ngram';

SELECT *
FROM bf_tokenbf_lowcard_test
WHERE like(lc, '%CD3%')
SETTINGS force_data_skipping_indices = 'lc_bf_tokenbf';

SELECT *
FROM bf_tokenbf_lowcard_test
WHERE like(lc, '%CD4%')
SETTINGS force_data_skipping_indices = 'lc_bf_tokenbf';

SELECT *
FROM bf_tokenbf_lowcard_test
WHERE like(lc, '%CD5%')
SETTINGS force_data_skipping_indices = 'lc_bf_tokenbf';

SELECT *
FROM bf_tokenbf_lowcard_test
WHERE like(lc_fixed, '%CD3%')
SETTINGS force_data_skipping_indices = 'lc_fixed_bf_tokenbf';

SELECT *
FROM bf_tokenbf_lowcard_test
WHERE like(lc_fixed, '%CD4%')
SETTINGS force_data_skipping_indices = 'lc_fixed_bf_tokenbf';

SELECT *
FROM bf_tokenbf_lowcard_test
WHERE like(lc_fixed, '%CD5%')
SETTINGS force_data_skipping_indices = 'lc_fixed_bf_tokenbf';

SELECT *
FROM bf_ngram_lowcard_test
WHERE like(lc, '%CD3%')
SETTINGS force_data_skipping_indices = 'lc_ngram';

SELECT *
FROM bf_ngram_lowcard_test
WHERE like(lc, '%CD4%')
SETTINGS force_data_skipping_indices = 'lc_ngram';

SELECT *
FROM bf_ngram_lowcard_test
WHERE like(lc, '%CD5%')
SETTINGS force_data_skipping_indices = 'lc_ngram';

SELECT *
FROM bf_ngram_lowcard_test
WHERE like(lc_fixed, '%CD3%')
SETTINGS force_data_skipping_indices = 'lc_fixed_ngram';

SELECT *
FROM bf_ngram_lowcard_test
WHERE like(lc_fixed, '%CD4%')
SETTINGS force_data_skipping_indices = 'lc_fixed_ngram';

SELECT *
FROM bf_ngram_lowcard_test
WHERE like(lc_fixed, '%CD5%')
SETTINGS force_data_skipping_indices = 'lc_fixed_ngram';