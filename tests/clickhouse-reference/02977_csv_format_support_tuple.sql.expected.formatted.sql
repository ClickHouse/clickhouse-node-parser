SET output_format_csv_serialize_tuple_into_separate_columns = false;

SET input_format_csv_deserialize_separate_columns_into_tuple = false;

SET input_format_csv_try_infer_strings_from_quoted_tuples = false;

SELECT *
FROM file(concat(currentDatabase(), '02977_1.csv'))
SETTINGS max_threads = 1;