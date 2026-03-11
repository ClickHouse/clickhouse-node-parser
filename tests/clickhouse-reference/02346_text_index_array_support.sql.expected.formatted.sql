SELECT '-- with String';

SELECT count()
FROM tab
WHERE has(arr, 'foo');

SELECT count()
FROM tab
WHERE has(arr, 'bar');

SELECT count()
FROM tab
WHERE has(arr, 'baz');

SELECT count()
FROM tab
WHERE has(arr, 'def');

SELECT count()
FROM tab
WHERE has(arr_fixed, toFixedString('foo', 3));

SELECT count()
FROM tab
WHERE has(arr_fixed, toFixedString('bar', 3));

SELECT count()
FROM tab
WHERE has(arr_fixed, toFixedString('baz', 3));

SELECT count()
FROM tab
WHERE has(arr_fixed, toFixedString('def', 3));

SELECT *
FROM explain_index_has(use_idx_fixed = 0, filter = 'abc');

SELECT *
FROM explain_index_has(use_idx_fixed = 0, filter = 'baz');

SELECT *
FROM explain_index_has(use_idx_fixed = 0, filter = 'foo');

SELECT *
FROM explain_index_has(use_idx_fixed = 0, filter = 'bar');

SELECT *
FROM explain_index_has(use_idx_fixed = 0, filter = 'def');

SELECT *
FROM explain_index_has(use_idx_fixed = 1, filter = toFixedString('abc', 3));

SELECT *
FROM explain_index_has(use_idx_fixed = 1, filter = toFixedString('baz', 3));

SELECT *
FROM explain_index_has(use_idx_fixed = 1, filter = toFixedString('foo', 3));

SELECT *
FROM explain_index_has(use_idx_fixed = 1, filter = toFixedString('bar', 3));

SELECT *
FROM explain_index_has(use_idx_fixed = 1, filter = toFixedString('def', 3));

SELECT count()
FROM tab
WHERE hasAnyTokens(arr, 'foo');

SELECT count()
FROM tab
WHERE hasAnyTokens(arr, 'bar');

SELECT count()
FROM tab
WHERE hasAnyTokens(arr, 'foo bar');

SELECT count()
FROM tab
WHERE hasAnyTokens(arr_fixed, 'foo');

SELECT count()
FROM tab
WHERE hasAnyTokens(arr_fixed, 'bar');

SELECT count()
FROM tab
WHERE hasAnyTokens(arr_fixed, 'foo bar');

SELECT *
FROM explain_index_has_any_tokens(use_idx_fixed = 0, filter = 'abc');

SELECT *
FROM explain_index_has_any_tokens(use_idx_fixed = 0, filter = 'baz');

SELECT *
FROM explain_index_has_any_tokens(use_idx_fixed = 0, filter = 'foo');

SELECT *
FROM explain_index_has_any_tokens(use_idx_fixed = 0, filter = 'foo bar');

SELECT *
FROM explain_index_has_any_tokens(use_idx_fixed = 0, filter = 'def');

SELECT *
FROM explain_index_has_any_tokens(use_idx_fixed = 1, filter = 'abc');

SELECT *
FROM explain_index_has_any_tokens(use_idx_fixed = 1, filter = 'baz');

SELECT *
FROM explain_index_has_any_tokens(use_idx_fixed = 1, filter = 'foo');

SELECT *
FROM explain_index_has_any_tokens(use_idx_fixed = 1, filter = 'foo bar');

SELECT *
FROM explain_index_has_any_tokens(use_idx_fixed = 1, filter = 'def');

SELECT count()
FROM tab
WHERE hasAllTokens(arr, 'foo');

SELECT count()
FROM tab
WHERE hasAllTokens(arr, 'bar');

SELECT count()
FROM tab
WHERE hasAllTokens(arr, 'foo bar');

SELECT count()
FROM tab
WHERE hasAllTokens(arr_fixed, 'foo');

SELECT count()
FROM tab
WHERE hasAllTokens(arr_fixed, 'bar');

SELECT count()
FROM tab
WHERE hasAllTokens(arr_fixed, 'foo bar');

SELECT *
FROM explain_index_has_all_tokens(use_idx_fixed = 0, filter = 'abc');

SELECT *
FROM explain_index_has_all_tokens(use_idx_fixed = 0, filter = 'baz');

SELECT *
FROM explain_index_has_all_tokens(use_idx_fixed = 0, filter = 'foo');

SELECT *
FROM explain_index_has_all_tokens(use_idx_fixed = 0, filter = 'foo bar');

SELECT *
FROM explain_index_has_all_tokens(use_idx_fixed = 0, filter = 'def');

SELECT *
FROM explain_index_has_all_tokens(use_idx_fixed = 1, filter = 'abc');

SELECT *
FROM explain_index_has_all_tokens(use_idx_fixed = 1, filter = 'baz');

SELECT *
FROM explain_index_has_all_tokens(use_idx_fixed = 1, filter = 'foo');

SELECT *
FROM explain_index_has_all_tokens(use_idx_fixed = 1, filter = 'foo bar');

SELECT *
FROM explain_index_has_all_tokens(use_idx_fixed = 1, filter = 'def');