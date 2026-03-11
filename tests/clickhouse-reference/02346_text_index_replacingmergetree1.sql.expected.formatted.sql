SELECT '-- direct read disabled';

SELECT value
FROM tab
WHERE hasToken(key, 'foo')
ORDER BY value ASC;

SELECT value
FROM tab FINAL
WHERE hasToken(key, 'foo')
ORDER BY value ASC;

SELECT value
FROM tab
WHERE hasToken(key, 'bar')
ORDER BY value ASC;

SELECT value
FROM tab FINAL
WHERE hasToken(key, 'bar')
ORDER BY value ASC;

SELECT value
FROM tab
WHERE hasToken(key, 'baz')
ORDER BY value ASC;

SELECT value
FROM tab FINAL
WHERE hasToken(key, 'baz')
ORDER BY value ASC;