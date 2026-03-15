-- Tags: no-fasttest
SET session_timezone = 'UTC';

SET engine_file_truncate_on_insert = 1;

SELECT date_field
FROM file(concat(current_database(), '_03259.orc'), 'ORC')
ORDER BY number ASC;