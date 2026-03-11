select 'Primary key:', count() from 03581_data where key = 2000;
select 'Skip index MinMax:', count() from 03581_data where val_minmax = 2000;
select 'Skip index Set:', count() from 03581_data where val_set = 2000;
select read_rows
from system.query_log
where current_database = currentDatabase()
  and type = 'QueryFinish'
  and query ilike '% from 03581_data where %'
order by event_time_microseconds desc;
