create table data (key Int) engine=MergeTree() order by () settings prewarm_mark_cache=0;
set load_marks_asynchronously=0;
--
-- SELECTs
--
select * from data format Null settings load_marks_asynchronously=0;
select * from data format Null settings load_marks_asynchronously=1;
select query_kind, Settings['load_marks_asynchronously'] load_marks_asynchronously, ProfileEvents['MarkCacheHits'] hits, ProfileEvents['MarkCacheMisses'] misses
  from system.query_log
  where current_database = currentDatabase() and query_kind in ('Select', 'Insert') and type != 'QueryStart'
  order by event_time_microseconds
  format CSVWithNames;
select part_name, ProfileEvents['MarkCacheHits'] hits, ProfileEvents['MarkCacheMisses'] misses
  from system.part_log
  where database = currentDatabase() and event_type = 'MergeParts'
  order by event_time_microseconds
  format CSVWithNames;
