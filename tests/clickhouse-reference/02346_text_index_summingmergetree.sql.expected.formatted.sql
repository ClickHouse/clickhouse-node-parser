SELECT '-- direct read disabled';

SELECT sum(value)
FROM tab
WHERE hasToken(key, 'foo');

SELECT sum(value)
FROM tab
WHERE hasToken(key, 'bar');

SELECT value
FROM tab
WHERE hasToken(key, 'foo');

SELECT value
FROM tab
WHERE hasToken(key, 'bar');