CREATE TABLE tableFile_00968(number UInt64) ENGINE = File('TSV');
CREATE TABLE tableMergeTree_00968(id UInt64) ENGINE = MergeTree() PARTITION BY id ORDER BY id;
SELECT id FROM tableMergeTree_00968 WHERE id IN (SELECT number FROM tableFile_00968) ORDER BY id;
