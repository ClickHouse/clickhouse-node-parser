set allow_deprecated_syntax_for_merge_tree=1;
CREATE TABLE report1(id UInt32, event_date Date, priority UInt32, description String) ENGINE = MergeTree(event_date, intHash32(id), (id, event_date, intHash32(id)), 8192);
CREATE TABLE report2(id UInt32, event_date Date, priority UInt32, description String) ENGINE = MergeTree(event_date, intHash32(id), (id, event_date, intHash32(id)), 8192);
SELECT * FROM (SELECT id, event_date, priority, description FROM remote('127.0.0.{2,3}', currentDatabase(), report1) UNION ALL SELECT id, event_date, priority, description FROM remote('127.0.0.{2,3}', currentDatabase(), report2)) ORDER BY id, event_date ASC;
