select '02095_system_logs_hostname' from system.one format Null;
select hostname
from system.query_log
where
    query like 'select \'02095_system_logs_hostname%'
    and current_database = currentDatabase()
    and event_date >= yesterday() LIMIT 1 FORMAT Null;


select hostName(), hostname
from system.query_thread_log
where
    query like 'select \'02095_system_logs_hostname%'
    and current_database = currentDatabase()
    and event_date >= yesterday() LIMIT 1 FORMAT Null;
