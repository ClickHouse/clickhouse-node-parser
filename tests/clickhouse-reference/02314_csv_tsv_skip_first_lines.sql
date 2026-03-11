select * from file(currentDatabase() || '_data_02314.csv') order by c1 settings input_format_csv_skip_first_lines=5;
select * from file(currentDatabase() || '_data_02314.tsv') order by c1 settings input_format_tsv_skip_first_lines=5;
