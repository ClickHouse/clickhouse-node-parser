SELECT query_count
FROM `system`.dictionaries
WHERE database = 'dict_db_02179'
    AND name = 'dict';

SELECT dictGetUInt64('dict_db_02179.dict', 'val', toUInt64(0));

SELECT dictGetUInt64('dict_db_02179.dict', 'val', toUInt64(1));