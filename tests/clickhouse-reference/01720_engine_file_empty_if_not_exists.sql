CREATE TABLE file_engine_table (id UInt32) ENGINE=File(TSV);
SELECT * FROM file_engine_table; --{ serverError FILE_DOESNT_EXIST }
SET engine_file_empty_if_not_exists=0;
SET engine_file_empty_if_not_exists=1;
