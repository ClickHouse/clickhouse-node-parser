select * from data settings load_marks_asynchronously=1 format Null /* 1 */;
select query, ProfileEvents['BackgroundLoadingMarksTasks']>0 async, ProfileEvents['MarksTasksFromCache']>0 sync
from system.query_log
where current_database = currentDatabase() and query_kind = 'Select' and type != 'QueryStart'
order by event_time_microseconds
format Vertical;
