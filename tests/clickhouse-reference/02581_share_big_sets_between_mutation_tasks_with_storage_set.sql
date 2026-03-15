CREATE TABLE 02581_trips(id UInt32, description String, id2 UInt32, PRIMARY KEY id) ENGINE=MergeTree ORDER BY id;
SELECT count() from 02581_trips WHERE description = '';
SELECT name FROM system.parts WHERE database=currentDatabase() AND table = '02581_trips' AND active ORDER BY name;
CREATE TABLE 02581_set (id UInt32) ENGINE = Set;
