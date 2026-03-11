select sum(e) from (select * from merged order by t limit 10) SETTINGS optimize_read_in_order = 0;
select sum(e) from (select * from merged order by t limit 10) SETTINGS max_threads = 1;
select sum(e) from (select * from merged order by t limit 10) SETTINGS max_threads = 3;
select sum(e) from (select * from merged order by t limit 10) SETTINGS max_threads = 10;
select sum(e) from (select * from merged order by t limit 10) SETTINGS max_threads = 50;
