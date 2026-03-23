DROP TABLE IF EXISTS table_from_remote;
DROP TABLE IF EXISTS table_from_select;
DROP TABLE IF EXISTS table_from_numbers;
CREATE TABLE table_from_remote AS remote('localhost', 'system', 'numbers');
ALTER TABLE table_from_remote ADD COLUMN col UInt8;
CREATE TABLE table_from_numbers AS numbers(1000);
ALTER TABLE table_from_numbers ADD COLUMN col UInt8; --{serverError NOT_IMPLEMENTED}
CREATE TABLE table_from_select ENGINE = MergeTree() ORDER BY tuple() AS SELECT number from system.numbers LIMIT 1;
ALTER TABLE table_from_select ADD COLUMN col UInt8;
