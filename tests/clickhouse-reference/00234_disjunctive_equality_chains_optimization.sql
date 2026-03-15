CREATE TABLE IF NOT EXISTS foo_00234(id UInt64) Engine=MergeTree ORDER BY tuple();
SELECT sum(id = 3 OR id = 1 OR id = 2) AS x, sum(id = 3 OR id = 1 OR id = 2) AS x FROM foo_00234;
