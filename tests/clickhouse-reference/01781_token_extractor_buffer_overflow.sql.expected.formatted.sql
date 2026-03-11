SELECT max(id)
FROM bloom_filter
WHERE hasToken(s, 'abc');

SELECT max(id)
FROM bloom_filter
WHERE hasToken(s, 'abcabcabcabcabcabcabcab\0');