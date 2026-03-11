SELECT id FROM tab WHERE hasAllTokens(c0.c1, 'aa aaa') SETTINGS force_data_skipping_indices = 'i0';
SELECT id FROM tab WHERE hasAllTokens(c1.s1, 'AAA') SETTINGS force_data_skipping_indices = 'i0';
SELECT id FROM tab WHERE hasAllTokens(coalesce(c1.s2, '')::String, 'BBB') SETTINGS force_data_skipping_indices = 'i1';
