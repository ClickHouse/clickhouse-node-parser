-- Tags: no-shared-merge-tree
SET alter_sync = 2;
-- {echoOn}
DROP TABLE IF EXISTS test;
CREATE TABLE test (a Int) ENGINE = MergeTree ORDER BY tuple();
INSERT INTO test VALUES (1), (2), (3);
SELECT part_name FROM system.parts where table='test' and active and database = currentDatabase();
