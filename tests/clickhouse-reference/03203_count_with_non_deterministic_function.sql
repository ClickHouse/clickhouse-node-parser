CREATE TABLE t (p UInt8, x UInt64) Engine = MergeTree PARTITION BY p ORDER BY x;
SELECT count() FROM t WHERE p = 0 AND rowNumberInAllBlocks() = 1 SETTINGS enable_analyzer = 0;
SELECT count() FROM t WHERE p = 0 AND rowNumberInAllBlocks() = 1 SETTINGS enable_analyzer = 1;
