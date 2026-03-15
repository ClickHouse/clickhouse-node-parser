CREATE TABLE insert_fewer_columns (a UInt8, b UInt8) ENGINE = Memory;
SELECT * FROM insert_fewer_columns;
CREATE TABLE insert_fewer_columns_2 (b UInt8, a UInt8) ENGINE = Memory;
SELECT a, b FROM insert_fewer_columns;
SELECT a, b FROM insert_fewer_columns_2;
