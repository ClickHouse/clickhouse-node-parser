DROP TABLE IF EXISTS test;
CREATE TABLE test(a UInt8, b String EPHEMERAL) Engine=MergeTree ORDER BY tuple();
SHOW CREATE TABLE test;
DROP TABLE test;
CREATE TABLE test(a UInt8, b EPHEMERAL String) Engine=MergeTree ORDER BY tuple(); -- { serverError UNKNOWN_IDENTIFIER }
CREATE TABLE test(a UInt8, b String EPHEMERAL test) Engine=MergeTree ORDER BY tuple(); -- { serverError UNKNOWN_IDENTIFIER }
CREATE TABLE test(a UInt8, b String EPHEMERAL 1+2) Engine=MergeTree ORDER BY tuple();
SELECT * FROM test;
