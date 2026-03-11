SELECT '-- Plain text index search functions';

SELECT count()
FROM tab
WHERE hasAnyTokens(text, ['']);

SELECT count()
FROM tab
WHERE hasAllTokens(text, ['']);

SELECT count()
FROM tab
WHERE hasToken(text, '');

SELECT count()
FROM tab
WHERE NOT hasAnyTokens(text, ['']);

SELECT count()
FROM tab
WHERE NOT hasAllTokens(text, ['']);

SELECT count()
FROM tab
WHERE NOT hasToken(text, '');