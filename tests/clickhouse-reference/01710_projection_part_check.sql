select part_type from system.parts where database = currentDatabase() and table = 'tp';
select part_type from system.projection_parts where database = currentDatabase() and table = 'tp';
