SELECT * FROM v WHERE has(value, 'foo') ORDER BY value;
SELECT * FROM v WHERE hasAny(value, ['bar']) ORDER BY value;
SELECT * FROM v WHERE has(value, 'x') ORDER BY value;
SELECT * FROM v2 WHERE has(value, ['foo']) ORDER BY value;
SELECT * FROM v2 WHERE has(value, [NULL]) ORDER BY value;
