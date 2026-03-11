SELECT id FROM tab WHERE hasAllTokens(lower(s1), 'a') ORDER BY id;
SELECT id FROM tab WHERE hasAllTokens(lower(s1), 'b') ORDER BY id;
SELECT id FROM tab WHERE hasAllTokens(concat(s1, ' ', s2), 'A');
SELECT id FROM tab WHERE hasAllTokens(concat(s1, ' ', s2), 'D');
