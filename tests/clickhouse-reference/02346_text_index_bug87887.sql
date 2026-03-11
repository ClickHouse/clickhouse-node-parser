SELECT 'Test hasToken(text, text):', count() FROM tab WHERE hasToken(c0, 'Hello');
SELECT 'Test hasToken(text, dummy):', count() FROM tab WHERE hasToken(c0, 'Dummy');
SELECT 'Test hasToken(text, nullable(text)):', count() FROM tab WHERE hasToken(c0, toNullable('Hello'));
SELECT 'Test hasToken(text, nullable(dummy)):', count() FROM tab WHERE hasToken(c0, toNullable('Dummy'));
SELECT 'Test hasToken(text, NULL):', count() FROM tab WHERE hasToken(c0, NULL);
