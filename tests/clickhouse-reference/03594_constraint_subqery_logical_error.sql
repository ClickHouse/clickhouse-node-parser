SELECT 1 FROM check_constraint WHERE 1 = 1 SETTINGS optimize_substitute_columns = 1, convert_query_to_cnf = 1;
SELECT 1 FROM assume_constraint WHERE 1 = 1 SETTINGS optimize_substitute_columns = 1, convert_query_to_cnf = 1;
