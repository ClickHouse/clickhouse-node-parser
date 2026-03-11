SELECT join_key,
       toTimeZone(dictGetDateTime('system.dict1', 'loading_start_time', toUInt64(dict_key)), 'UTC') AS datetime
FROM (select dictGetInt32('system.dict1', 'element_count', toUInt64(dict_key)) AS join_key, 1 AS dict_key) js1
LEFT JOIN (SELECT toInt32(2) AS join_key) js2
USING (join_key)
WHERE now() >= datetime;
