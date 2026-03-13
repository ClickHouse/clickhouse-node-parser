SELECT count()
FROM tab
WHERE hasToken(str, 'aa'); -- this must not return an error