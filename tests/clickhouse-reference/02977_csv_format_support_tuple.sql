SET output_format_csv_serialize_tuple_into_separate_columns = false;
SET input_format_csv_deserialize_separate_columns_into_tuple = false;
SET input_format_csv_try_infer_strings_from_quoted_tuples = false;
select * from file(currentDatabase() || '02977_1.csv') settings max_threads=1;
