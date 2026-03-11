SELECT *
FROM data_01515;

SELECT *
FROM data_01515
SETTINGS force_data_skipping_indices = '';

SELECT *
FROM data_01515
SETTINGS force_data_skipping_indices = 'd1_idx';

SELECT *
FROM data_01515
SETTINGS force_data_skipping_indices = 'd1_null_idx';

SELECT *
FROM data_01515
WHERE d1 = 0
SETTINGS force_data_skipping_indices = 'd1_idx';

SELECT *
FROM data_01515
WHERE d1 = 0
SETTINGS force_data_skipping_indices = '`d1_idx`';

SELECT *
FROM data_01515
WHERE d1 = 0
SETTINGS force_data_skipping_indices = ' d1_idx ';

SELECT *
FROM data_01515
WHERE d1 = 0
SETTINGS force_data_skipping_indices = 'd1_idx,d1_null_idx';

SELECT *
FROM data_01515
WHERE d1 = 0
SETTINGS force_data_skipping_indices = 'd1_null_idx,d1_idx';

SELECT *
FROM data_01515
WHERE d1 = 0
SETTINGS force_data_skipping_indices = 'd1_null_idx,d1_idx,,';

SELECT *
FROM data_01515
WHERE d1 = 0
SETTINGS force_data_skipping_indices = '  d1_null_idx,d1_idx';

SELECT *
FROM data_01515
WHERE d1 = 0
SETTINGS force_data_skipping_indices = '  `d1_null_idx`,d1_idx';

SELECT *
FROM data_01515
WHERE d1 = 0
SETTINGS force_data_skipping_indices = 'd1_null_idx';

SELECT *
FROM data_01515
WHERE d1 = 0
SETTINGS force_data_skipping_indices = '  d1_null_idx  ';

SELECT *
FROM data_01515
WHERE d1_null = 0
SETTINGS force_data_skipping_indices = 'd1_null_idx';

SELECT *
FROM data_01515
WHERE assumeNotNull(d1_null) = 0
SETTINGS force_data_skipping_indices = 'd1_null_idx';