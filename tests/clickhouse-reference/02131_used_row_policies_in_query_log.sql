SELECT * FROM 02131_rqtable;
SELECT query, used_row_policies FROM system.query_log WHERE current_database == currentDatabase() AND type == 'QueryStart' AND query_kind == 'Select' ORDER BY event_time_microseconds;
