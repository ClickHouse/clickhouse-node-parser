select 'foo' format Values;
select 'foo\'bar' format Values;
select 'foo\'\'bar' format Values;
select '\noutput_format_values_escape_quote_with_quote=1' format LineAsString;
set output_format_values_escape_quote_with_quote=1;
-- fix no newline at end of file
select '' format LineAsString;
