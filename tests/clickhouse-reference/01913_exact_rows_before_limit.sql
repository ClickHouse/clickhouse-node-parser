select 0 from test_rows_compact_part limit 1 FORMAT JSONCompact settings exact_rows_before_limit = 0,output_format_write_statistics = 0;
select 0 from test_rows_compact_part limit 1 FORMAT JSONCompact settings exact_rows_before_limit = 1, output_format_write_statistics = 0;
select 0 from test_rows_wide_part limit 1 FORMAT JSONCompact settings exact_rows_before_limit = 0,output_format_write_statistics = 0;
select 0 from test_rows_wide_part limit 1 FORMAT JSONCompact settings exact_rows_before_limit = 1, output_format_write_statistics = 0;
