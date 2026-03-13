SELECT count(*)
FROM tab
WHERE u64 = 7;

SELECT count(*)
FROM tab
WHERE u64_tdigest = 7;

SELECT count(*)
FROM tab
WHERE u64_minmax = 7;

SELECT count(*)
FROM tab
WHERE u64_countmin = 7;

SELECT count(*)
FROM tab
WHERE u64_uniq = 7;

SELECT count(*)
FROM tab
WHERE u64 = 7.7;

SELECT count(*)
FROM tab
WHERE u64_tdigest = 7.7;

SELECT count(*)
FROM tab
WHERE u64_minmax = 7.7;

SELECT count(*)
FROM tab
WHERE u64_countmin = 7.7;

SELECT count(*)
FROM tab
WHERE u64_uniq = 7.7;

SELECT count(*)
FROM tab
WHERE u64 = '7';

SELECT count(*)
FROM tab
WHERE u64_tdigest = '7';

SELECT count(*)
FROM tab
WHERE u64_minmax = '7';

SELECT count(*)
FROM tab
WHERE u64_countmin = '7';

SELECT count(*)
FROM tab
WHERE u64_uniq = '7';

SELECT count(*)
FROM tab
WHERE u64 = '7.7'; -- { serverError TYPE_MISMATCH }

SELECT count(*)
FROM tab
WHERE u64_tdigest = '7.7'; -- { serverError TYPE_MISMATCH }

SELECT count(*)
FROM tab
WHERE u64_minmax = '7.7'; -- { serverError TYPE_MISMATCH }

SELECT count(*)
FROM tab
WHERE u64_countmin = '7.7'; -- { serverError TYPE_MISMATCH }

SELECT count(*)
FROM tab
WHERE u64_uniq = '7.7'; -- { serverError TYPE_MISMATCH }

SELECT count(*)
FROM tab
WHERE u64 < 7;

SELECT count(*)
FROM tab
WHERE u64_tdigest < 7;

SELECT count(*)
FROM tab
WHERE u64_minmax < 7;

SELECT count(*)
FROM tab
WHERE u64_countmin < 7;

SELECT count(*)
FROM tab
WHERE u64_uniq < 7;

SELECT count(*)
FROM tab
WHERE u64 < 7.7;

SELECT count(*)
FROM tab
WHERE u64_tdigest < 7.7;

SELECT count(*)
FROM tab
WHERE u64_minmax < 7.7;

SELECT count(*)
FROM tab
WHERE u64_countmin < 7.7;

SELECT count(*)
FROM tab
WHERE u64_uniq < 7.7;

SELECT count(*)
FROM tab
WHERE u64 < '7';

SELECT count(*)
FROM tab
WHERE u64_tdigest < '7';

SELECT count(*)
FROM tab
WHERE u64_minmax < '7';

SELECT count(*)
FROM tab
WHERE u64_countmin < '7';

SELECT count(*)
FROM tab
WHERE u64_uniq < '7';

SELECT count(*)
FROM tab
WHERE u64 < '7.7'; -- { serverError TYPE_MISMATCH }

SELECT count(*)
FROM tab
WHERE u64_tdigest < '7.7'; -- { serverError TYPE_MISMATCH }

SELECT count(*)
FROM tab
WHERE u64_minmax < '7.7'; -- { serverError TYPE_MISMATCH }

SELECT count(*)
FROM tab
WHERE u64_countmin < '7.7'; -- { serverError TYPE_MISMATCH }

SELECT count(*)
FROM tab
WHERE u64_uniq < '7.7'; -- { serverError TYPE_MISMATCH }

SELECT count(*)
FROM tab
WHERE f64 = 7;

SELECT count(*)
FROM tab
WHERE f64_tdigest = 7;

SELECT count(*)
FROM tab
WHERE f64_minmax = 7;

SELECT count(*)
FROM tab
WHERE f64_countmin = 7;

SELECT count(*)
FROM tab
WHERE f64_uniq = 7;

SELECT count(*)
FROM tab
WHERE f64 = 7.7;

SELECT count(*)
FROM tab
WHERE f64_tdigest = 7.7;

SELECT count(*)
FROM tab
WHERE f64_minmax = 7.7;

SELECT count(*)
FROM tab
WHERE f64_countmin = 7.7;

SELECT count(*)
FROM tab
WHERE f64_uniq = 7.7;

SELECT count(*)
FROM tab
WHERE f64 = '7';

SELECT count(*)
FROM tab
WHERE f64_tdigest = '7';

SELECT count(*)
FROM tab
WHERE f64_minmax = '7';

SELECT count(*)
FROM tab
WHERE f64_countmin = '7';

SELECT count(*)
FROM tab
WHERE f64_uniq = '7';

SELECT count(*)
FROM tab
WHERE f64 = '7.7';

SELECT count(*)
FROM tab
WHERE f64_tdigest = '7.7';

SELECT count(*)
FROM tab
WHERE f64_minmax = '7.7';

SELECT count(*)
FROM tab
WHERE f64_countmin = '7.7';

SELECT count(*)
FROM tab
WHERE f64_uniq = '7.7';

SELECT count(*)
FROM tab
WHERE f64 < 7;

SELECT count(*)
FROM tab
WHERE f64_tdigest < 7;

SELECT count(*)
FROM tab
WHERE f64_minmax < 7;

SELECT count(*)
FROM tab
WHERE f64_countmin < 7;

SELECT count(*)
FROM tab
WHERE f64_uniq < 7;

SELECT count(*)
FROM tab
WHERE f64 < 7.7;

SELECT count(*)
FROM tab
WHERE f64_tdigest < 7.7;

SELECT count(*)
FROM tab
WHERE f64_minmax < 7.7;

SELECT count(*)
FROM tab
WHERE f64_countmin < 7.7;

SELECT count(*)
FROM tab
WHERE f64_uniq < 7.7;

SELECT count(*)
FROM tab
WHERE f64 < '7';

SELECT count(*)
FROM tab
WHERE f64_tdigest < '7';

SELECT count(*)
FROM tab
WHERE f64_minmax < '7';

SELECT count(*)
FROM tab
WHERE f64_countmin < '7';

SELECT count(*)
FROM tab
WHERE f64_uniq < '7';

SELECT count(*)
FROM tab
WHERE f64 < '7.7';

SELECT count(*)
FROM tab
WHERE f64_tdigest < '7.7';

SELECT count(*)
FROM tab
WHERE f64_minmax < '7.7';

SELECT count(*)
FROM tab
WHERE f64_countmin < '7.7';

SELECT count(*)
FROM tab
WHERE f64_uniq < '7.7';

SELECT count(*)
FROM tab
WHERE dt = '2024-08-08 11:12:13';

SELECT count(*)
FROM tab
WHERE dt_tdigest = '2024-08-08 11:12:13';

SELECT count(*)
FROM tab
WHERE dt_minmax = '2024-08-08 11:12:13';

SELECT count(*)
FROM tab
WHERE dt_countmin = '2024-08-08 11:12:13';

SELECT count(*)
FROM tab
WHERE dt_uniq = '2024-08-08 11:12:13';

SELECT count(*)
FROM tab
WHERE dt = 7;

SELECT count(*)
FROM tab
WHERE dt_tdigest = 7;

SELECT count(*)
FROM tab
WHERE dt_minmax = 7;

SELECT count(*)
FROM tab
WHERE dt_countmin = 7;

SELECT count(*)
FROM tab
WHERE dt_uniq = 7;

SELECT count(*)
FROM tab
WHERE dt < '2024-08-08 11:12:13';

SELECT count(*)
FROM tab
WHERE dt_tdigest < '2024-08-08 11:12:13';

SELECT count(*)
FROM tab
WHERE dt_minmax < '2024-08-08 11:12:13';

SELECT count(*)
FROM tab
WHERE dt_countmin < '2024-08-08 11:12:13';

SELECT count(*)
FROM tab
WHERE dt_uniq < '2024-08-08 11:12:13';

SELECT count(*)
FROM tab
WHERE dt < 7;

SELECT count(*)
FROM tab
WHERE dt_tdigest < 7;

SELECT count(*)
FROM tab
WHERE dt_minmax < 7;

SELECT count(*)
FROM tab
WHERE dt_countmin < 7;

SELECT count(*)
FROM tab
WHERE dt_uniq < 7;

SELECT count(*)
FROM tab
WHERE b = true;

SELECT count(*)
FROM tab
WHERE b_tdigest = true;

SELECT count(*)
FROM tab
WHERE b_minmax = true;

SELECT count(*)
FROM tab
WHERE b_countmin = true;

SELECT count(*)
FROM tab
WHERE b_uniq = true;

SELECT count(*)
FROM tab
WHERE b = 'true';

SELECT count(*)
FROM tab
WHERE b_tdigest = 'true';

SELECT count(*)
FROM tab
WHERE b_minmax = 'true';

SELECT count(*)
FROM tab
WHERE b_countmin = 'true';

SELECT count(*)
FROM tab
WHERE b_uniq = 'true';

SELECT count(*)
FROM tab
WHERE b = 1;

SELECT count(*)
FROM tab
WHERE b_tdigest = 1;

SELECT count(*)
FROM tab
WHERE b_minmax = 1;

SELECT count(*)
FROM tab
WHERE b_countmin = 1;

SELECT count(*)
FROM tab
WHERE b_uniq = 1;

SELECT count(*)
FROM tab
WHERE b = 1.1;

SELECT count(*)
FROM tab
WHERE b_tdigest = 1.1;

SELECT count(*)
FROM tab
WHERE b_minmax = 1.1;

SELECT count(*)
FROM tab
WHERE b_countmin = 1.1;

SELECT count(*)
FROM tab
WHERE b_uniq = 1.1;

SELECT count(*)
FROM tab
WHERE s = 7; -- { serverError NO_COMMON_TYPE }

-- SELECT count(*) FROM tab WHERE s_tdigest = 7; -- not supported
-- SELECT count(*) FROM tab WHERE s_minmax = 7; -- not supported
SELECT count(*)
FROM tab
WHERE s_countmin = 7; -- { serverError NO_COMMON_TYPE }

SELECT count(*)
FROM tab
WHERE s_uniq = 7; -- { serverError NO_COMMON_TYPE }

SELECT count(*)
FROM tab
WHERE s = '7';

-- SELECT count(*) FROM tab WHERE s_tdigest = '7'; -- not supported
-- SELECT count(*) FROM tab WHERE s_minmax = '7'; -- not supported
SELECT count(*)
FROM tab
WHERE s_countmin = '7';

SELECT count(*)
FROM tab
WHERE s_uniq = '7';