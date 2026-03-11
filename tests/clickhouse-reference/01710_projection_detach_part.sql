select count() from system.projection_parts where database = currentDatabase() and table = 't' and active;
