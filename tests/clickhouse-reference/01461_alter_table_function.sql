CREATE TABLE table_from_remote AS remote('localhost', 'system', 'numbers');
CREATE TABLE table_from_numbers AS numbers(1000);
CREATE TABLE table_from_select ENGINE = MergeTree() ORDER BY tuple() AS SELECT number from system.numbers LIMIT 1;
