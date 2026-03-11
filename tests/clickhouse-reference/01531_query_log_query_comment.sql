select /* test=01531, enable_global_with_statement=0 */ 2;
select count() from system.query_log
where event_date >= yesterday()
    and query like 'select /* test=01531, enable_global_with_statement=0 */ 2%'
    and current_database = currentDatabase()
    ;
