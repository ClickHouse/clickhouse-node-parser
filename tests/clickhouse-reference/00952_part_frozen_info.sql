CREATE TABLE part_info (t DateTime) ENGINE = MergeTree PARTITION BY toDate(t) ORDER BY (t);
SELECT name, is_frozen FROM system.parts WHERE `database` = currentDatabase() AND `table` = 'part_info';
select * from part_info order by t;
