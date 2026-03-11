select date_field from file(current_database() || '_03259.orc', 'ORC') order by number;
