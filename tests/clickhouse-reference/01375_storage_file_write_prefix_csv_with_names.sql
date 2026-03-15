CREATE TABLE tmp_01375 (n UInt32, s String) ENGINE = Memory;
CREATE TABLE table_csv_01375 AS tmp_01375 ENGINE = File(CSVWithNames);
SELECT * FROM table_csv_01375;
