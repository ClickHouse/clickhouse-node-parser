SELECT k1, k2, payload
FROM f
WHERE dictGet('dict_prices_ckh', 'tag', (k1, k2)) = 'pro'
ORDER BY k1, k2, payload;
SELECT k1, k2, payload
FROM f
WHERE dictGet('dict_prices_ch_array', 'tag', (k1, k2)) = 'pro'
ORDER BY k1, k2, payload;
SELECT k1, k2, payload
FROM f
WHERE dictGet('dict_prices_ck_sparse_hashed', 'tag', (k1, k2)) = 'pro'
ORDER BY k1, k2, payload;
SELECT id, payload
FROM f
WHERE dictGet('dict_items_flat', 'name', id) = 'alpha'
ORDER BY id, payload;
SELECT id, payload
FROM f
WHERE dictGet('dict_items_hashed', 'name', id) = 'alpha'
ORDER BY id, payload;
SELECT id, payload
FROM f
WHERE dictGet('dict_items_hashed_array', 'name', id) = 'alpha'
ORDER BY id, payload;
SELECT id, payload
FROM f
WHERE dictGet('dict_items_sparse_hashed', 'name', id) = 'alpha'
ORDER BY id, payload;
