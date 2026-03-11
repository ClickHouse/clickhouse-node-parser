SELECT max(id)
FROM bloom_filter
WHERE hasToken(s, 'abc,def,zzz');

SELECT max(id)
FROM bloom_filter
WHERE hasTokenCaseInsensitive(s, 'abc,def,zzz');

SELECT max(id)
FROM bloom_filter
WHERE hasTokenOrNull(s, 'abc,def,zzz');

SELECT max(id)
FROM bloom_filter
WHERE hasTokenCaseInsensitiveOrNull(s, 'abc,def,zzz');

SELECT max(id)
FROM bloom_filter
WHERE hasToken(s, 'abc');

SELECT max(id)
FROM bloom_filter
WHERE hasTokenOrNull(s, 'abc');

SELECT max(id)
FROM bloom_filter
WHERE hasTokenCaseInsensitive(s, 'ABC');

SELECT max(id)
FROM bloom_filter
WHERE hasTokenCaseInsensitiveOrNull(s, 'ABC');

SELECT max(id)
FROM bloom_filter
WHERE hasToken(s, 'def');

SELECT max(id)
FROM bloom_filter
WHERE hasToken(s, 'zzz');

SELECT max(id)
FROM bloom_filter
WHERE hasTokenCaseInsensitive(s, 'zZz');

SELECT max(id)
FROM bloom_filter2
WHERE hasToken(s, 'ABC');

SELECT max(id)
FROM bloom_filter2
WHERE hasTokenCaseInsensitive(s, 'abc');

SELECT max(id)
FROM bloom_filter
WHERE hasToken(s, 'yyy');

SELECT max(id)
FROM bloom_filter
WHERE hasToken(s, 'zzz') == 1;

SELECT *
FROM tab
WHERE str == 'else'
    AND 1.0;