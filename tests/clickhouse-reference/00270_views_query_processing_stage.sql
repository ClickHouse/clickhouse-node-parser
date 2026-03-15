CREATE VIEW view1_00270 AS SELECT number FROM system.numbers LIMIT 10;
CREATE VIEW view2_00270 AS SELECT number FROM system.numbers LIMIT 10;
CREATE TABLE merge_view_00270 (number UInt64) ENGINE = Merge(currentDatabase(), '^view');
SELECT 'Hello, world!' FROM merge_view_00270 LIMIT 5;
