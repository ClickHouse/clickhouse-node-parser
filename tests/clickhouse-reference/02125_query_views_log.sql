-- { echo }
select view_name, read_rows, read_bytes, written_rows, written_bytes from system.query_views_log where startsWith(view_name, currentDatabase() || '.mv') order by view_name format Vertical;
select read_rows, read_bytes, written_rows, written_bytes from system.query_log where type = 'QueryFinish' and query_kind = 'Insert' and current_database = currentDatabase() format Vertical;
