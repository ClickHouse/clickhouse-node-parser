SELECT 'foo'
FORMAT Values;

SELECT 'foo''bar'
FORMAT Values;

SELECT 'foo''''bar'
FORMAT Values;

SELECT '\noutput_format_values_escape_quote_with_quote=1'
FORMAT LineAsString;

SET output_format_values_escape_quote_with_quote = 1;

SELECT 'foo'
FORMAT Values;

SELECT 'foo''bar'
FORMAT Values;

SELECT 'foo''''bar'
FORMAT Values;

SELECT ''
FORMAT LineAsString;