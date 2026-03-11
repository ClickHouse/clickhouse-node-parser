SELECT toFixedString('''', 4)
FORMAT Values;

SELECT toFixedString('foo''bar', 8)
FORMAT Values;

SELECT '\noutput_format_values_escape_quote_with_quote=1'
FORMAT LineAsString;

SELECT ''
FORMAT LineAsString;