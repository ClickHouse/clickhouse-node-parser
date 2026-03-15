CREATE TABLE tbl(a String, b UInt32, c Float64, d Int64, e UInt8) ENGINE=MergeTree ORDER BY tuple();
SET mutations_sync = 1;
SELECT * FROM tbl FORMAT TabSeparatedWithNamesAndTypes;
