CREATE TABLE defaults_all_columns (n UInt8 DEFAULT 42, s String DEFAULT concat('test', CAST(n, 'String'))) ENGINE = Memory;
SELECT * FROM defaults_all_columns ORDER BY n, s;
