SELECT COUNT(*)
FROM file('data_03198_table_function_directory_path');

SELECT COUNT(*)
FROM file('data_03198_table_function_directory_path/');

SELECT COUNT(*)
FROM file('data_03198_table_function_directory_path/dir');

SELECT COUNT(*)
FROM file('data_03198_table_function_directory_path/*/dir', 'csv');

SELECT COUNT(*)
FROM file('data_03198_table_function_directory_pat');

SELECT COUNT(*)
FROM file('data_03198_table_function_directory_path.csv');