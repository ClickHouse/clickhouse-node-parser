SELECT *
FROM file(concat(currentDatabase(), '_data_02314.csv'))
ORDER BY c1 ASC
SETTINGS input_format_csv_skip_first_lines = 5;

SELECT *
FROM file(concat(currentDatabase(), '_data_02314.tsv'))
ORDER BY c1 ASC
SETTINGS input_format_tsv_skip_first_lines = 5;