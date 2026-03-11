select '01547_query_log_current_database' from system.one format Null;
select count()
from system.query_log
where
    query like 'select \'01547_query_log_current_database%'
    and current_database = currentDatabase()
    and event_date >= yesterday();

-- at least two threads for processing
-- (but one just waits for another, sigh)
select count() == 2
from system.query_thread_log
where
    query like 'select \'01547\_query\_log\_current\_database%'
    and current_database = currentDatabase()
    and event_date >= yesterday()
