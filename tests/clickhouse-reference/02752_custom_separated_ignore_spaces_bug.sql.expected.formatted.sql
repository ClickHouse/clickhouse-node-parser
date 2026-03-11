SELECT *
FROM format(CustomSeparatedIgnoreSpaces, 'x String', ' unquoted_string\n')
SETTINGS format_custom_escaping_rule = 'CSV';