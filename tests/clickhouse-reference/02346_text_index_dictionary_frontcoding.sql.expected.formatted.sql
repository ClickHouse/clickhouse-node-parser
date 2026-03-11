SELECT count()
FROM tab
WHERE hasToken(text_raw, 'foo');

SELECT count()
FROM tab
WHERE hasToken(text_fc, 'foo');

SELECT count()
FROM tab
WHERE hasToken(text_raw, 'bar');

SELECT count()
FROM tab
WHERE hasToken(text_fc, 'bar');

SELECT count()
FROM tab
WHERE hasToken(text_raw, 'abc');

SELECT count()
FROM tab
WHERE hasToken(text_fc, 'abc');