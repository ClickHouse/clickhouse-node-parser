CREATE DATABASE `01945.db`;
CREATE TABLE `01945.db`.test_dictionary_values
(
	id UInt64,
	value String
) ENGINE=TinyLog;
INSERT INTO `01945.db`.test_dictionary_values VALUES (0, 'Value');
CREATE DICTIONARY `01945.db`.test_dictionary
(
    id UInt64,
    value String
)
PRIMARY KEY id
LAYOUT(DIRECT())
SOURCE(CLICKHOUSE(DB '01945.db' TABLE 'test_dictionary_values'));
SELECT * FROM `01945.db`.test_dictionary;
CREATE DICTIONARY `01945.db`.`test_dictionary.test`
(
    id UInt64,
    value String
)
PRIMARY KEY id
LAYOUT(DIRECT())
SOURCE(CLICKHOUSE(DB '01945.db' TABLE 'test_dictionary_values'));
SELECT * FROM `01945.db`.`test_dictionary.test`;
