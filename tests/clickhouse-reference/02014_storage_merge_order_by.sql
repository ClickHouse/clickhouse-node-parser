CREATE TABLE short (e Int64, t DateTime ) ENGINE = MergeTree PARTITION BY e ORDER BY t;
CREATE TABLE long (e Int64, t DateTime ) ENGINE = MergeTree PARTITION BY (e, toStartOfMonth(t)) ORDER BY t;
CREATE TABLE merged as short ENGINE = Merge(currentDatabase(), 'short|long');
select sum(e) from (select * from merged order by t limit 10) SETTINGS optimize_read_in_order = 0;
select sum(e) from (select * from merged order by t limit 10) SETTINGS max_threads = 1;
select sum(e) from (select * from merged order by t limit 10) SETTINGS max_threads = 3;
select sum(e) from (select * from merged order by t limit 10) SETTINGS max_threads = 10;
select sum(e) from (select * from merged order by t limit 10) SETTINGS max_threads = 50;
