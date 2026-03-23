CREATE TABLE tbl(a String, b UInt32, c Float64, d Int64, e UInt8) ENGINE=MergeTree ORDER BY tuple();
INSERT INTO tbl SELECT number, number * 2, number * 3, number * 4, number * 5 FROM system.numbers LIMIT 10;
SET mutations_sync = 1;
SELECT * FROM tbl FORMAT TabSeparatedWithNamesAndTypes;
