SELECT count(*) from database_for_dict.dict1;
SELECT count(*) FROM database_for_dict.dict2;
SELECT count(*) FROM database_for_dict.dict3;
SELECT count(*) FROM database_for_dict.dict4; -- {serverError UNKNOWN_TABLE}
SELECT name from system.tables WHERE database = 'database_for_dict' ORDER BY name;
SELECT name from system.dictionaries WHERE database = 'database_for_dict' ORDER BY name;
