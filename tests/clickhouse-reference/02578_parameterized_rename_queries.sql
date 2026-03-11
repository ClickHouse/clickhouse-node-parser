SELECT name FROM system.databases WHERE name = {new_db_name:String};
-- NOTE: no 'database = currentDatabase()' on purpose
SELECT name FROM system.tables WHERE name = {new_tbl_name:String};
SELECT name FROM system.dictionaries WHERE name = {new_dict_name:String};
