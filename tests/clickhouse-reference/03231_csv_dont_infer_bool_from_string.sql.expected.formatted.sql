SET input_format_csv_try_infer_numbers_from_strings = 1;

SELECT *
FROM format(CSV, '"42","42.42","True"');