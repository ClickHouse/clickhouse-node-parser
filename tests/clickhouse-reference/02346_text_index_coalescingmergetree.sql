SELECT '-- direct read disabled';
SELECT value FROM tab WHERE hasToken(key, 'foo') ORDER BY value;
SELECT value FROM tab FINAL WHERE hasToken(key, 'foo') ORDER BY value;
SELECT value FROM tab WHERE hasToken(key, 'bar') ORDER BY value;
SELECT value FROM tab FINAL WHERE hasToken(key, 'bar') ORDER BY value;
