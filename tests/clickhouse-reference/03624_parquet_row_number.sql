select _row_number, x from file(current_database() ||'03624_parquet_row_number.parquet') where x % 3 != 0 and x > 60 order by _row_number;
