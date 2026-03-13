SELECT count(*)
FROM database_for_dict.dict1;

SELECT count(*)
FROM database_for_dict.dict2;

SELECT count(*)
FROM database_for_dict.dict3;

SELECT count(*)
FROM database_for_dict.dict4; -- {serverError UNKNOWN_TABLE}

SELECT name
FROM `system`.tables
WHERE database = 'database_for_dict'
ORDER BY name ASC;

SELECT name
FROM `system`.dictionaries
WHERE database = 'database_for_dict'
ORDER BY name ASC;