SELECT COUNT(*)
FROM file('data_03198_table_function_directory_path');

SELECT COUNT(*)
FROM file('data_03198_table_function_directory_path/');

SELECT COUNT(*)
FROM file('data_03198_table_function_directory_path/dir');

SELECT COUNT(*)
FROM file('data_03198_table_function_directory_path/*/dir', 'csv'); -- { serverError CANNOT_READ_FROM_FILE_DESCRIPTOR, CANNOT_EXTRACT_TABLE_STRUCTURE }

SELECT COUNT(*)
FROM file('data_03198_table_function_directory_pat'); -- { serverError CANNOT_STAT }

SELECT COUNT(*)
FROM file('data_03198_table_function_directory_path.csv');