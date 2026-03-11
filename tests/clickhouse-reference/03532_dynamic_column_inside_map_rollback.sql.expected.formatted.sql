SELECT c0
FROM format(CSV, 'c0 Map(Dynamic, String)', '
"{}"
"{[''a'', ''b''] : ''a'', ''''a'' : 1}"
')
SETTINGS input_format_allow_errors_num = 1;