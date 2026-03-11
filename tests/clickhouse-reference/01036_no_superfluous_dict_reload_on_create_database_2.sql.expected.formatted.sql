SELECT query_count
FROM `system`.dictionaries
WHERE database = 'foo 1234'
    AND name = 'dict';

SELECT dictGetUInt64('foo 1234.dict', 'val', toUInt64(0));