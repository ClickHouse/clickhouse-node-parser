-- Tags: no-fasttest

set engine_file_truncate_on_insert = 1;
select _row_number, x from file(current_database() ||'03624_parquet_row_number.parquet') where x % 3 != 0 and x > 60 order by _row_number;
