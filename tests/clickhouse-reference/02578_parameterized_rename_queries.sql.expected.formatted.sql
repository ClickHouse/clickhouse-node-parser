SET param_old_db_name = `02661_db`;

SET param_new_db_name = `02661_db1`;

CREATE DATABASE {old_db_name:Identifier};

SELECT name
FROM `system`.databases
WHERE name = {new_db_name:String};

SET param_old_tbl_name = `02661_t`;

SET param_new_tbl_name = `02661_t1`;

CREATE TABLE {new_db_name:Identifier}.{old_tbl_name:Identifier}
(
    a UInt64
)
ENGINE = MergeTree
ORDER BY tuple();

-- NOTE: no 'database = currentDatabase()' on purpose
SELECT name
FROM `system`.tables
WHERE name = {new_tbl_name:String};

SET param_old_dict_name = `02661_d`;

SET param_new_dict_name = `02661_d1`;

CREATE DICTIONARY {new_db_name:Identifier}.{old_dict_name:Identifier}
(
    id UInt64,
    val UInt8
)
PRIMARY KEY id
SOURCE(null())
LIFETIME(0)
LAYOUT(FLAT());

SELECT name
FROM `system`.dictionaries
WHERE name = {new_dict_name:String};