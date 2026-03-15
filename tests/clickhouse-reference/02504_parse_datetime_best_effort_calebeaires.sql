CREATE TEMPORARY TABLE my_table (col_date Date, col_date32 Date32, col_datetime DateTime('UTC'), col_datetime32 DateTime32('UTC'), col_datetime64 DateTime64);
-- The values for Date32 and DateTime64 will be year 1969, while the values of Date, DateTime will contain a value affected by implementation-defined overflow and can be arbitrary.
SELECT toYear(col_date), col_date32, toYear(col_datetime), toYear(col_datetime32), col_datetime64 FROM my_table;
