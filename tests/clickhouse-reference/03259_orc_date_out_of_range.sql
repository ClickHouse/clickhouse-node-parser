-- Tags: no-fasttest

SET session_timezone = 'UTC';
SET engine_file_truncate_on_insert = 1;
select date_field from file(current_database() || '_03259.orc', 'ORC') order by number;
