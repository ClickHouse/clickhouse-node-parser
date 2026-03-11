SELECT count() FROM tab WHERE hasToken(text, 'Hello');
SELECT trim(explain) FROM
(
    EXPLAIN actions = 1, indexes = 1 SELECT count() FROM tab WHERE hasToken(text, 'Hello') SETTINGS use_skip_indexes_on_data_read = 1
) WHERE explain LIKE '%Filter column%' OR explain LIKE '%Name: idx_text%';
SELECT count() FROM tab WHERE hasToken(lower(text), lower('Hello'));
SELECT trim(explain) FROM
(
    EXPLAIN actions = 1, indexes = 1 SELECT count() FROM tab WHERE hasToken(lower(text), lower('Hello')) SETTINGS use_skip_indexes_on_data_read = 1
) WHERE explain LIKE '%Filter column%' OR explain LIKE '%Name: idx_text%';
SELECT count() FROM tab WHERE hasAllTokens(text, ['Hello']);
SELECT trim(explain) FROM
(
    EXPLAIN actions = 1, indexes = 1 SELECT count() FROM tab WHERE hasAllTokens(text, ['Hello']) SETTINGS use_skip_indexes_on_data_read = 1
) WHERE explain LIKE '%Filter column%' OR explain LIKE '%Name: idx_text%';
SELECT count() FROM tab WHERE hasAllTokens(lower(text), [lower('Hello')]);
SELECT trim(explain) FROM
(
    EXPLAIN actions = 1, indexes = 1 SELECT count() FROM tab WHERE hasAllTokens(lower(text), [lower('Hello')]) SETTINGS use_skip_indexes_on_data_read = 1
) WHERE explain LIKE '%Filter column%' OR explain LIKE '%Name: idx_text%';
