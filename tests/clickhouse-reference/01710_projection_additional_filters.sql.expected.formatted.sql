SELECT
    count(),
    min(a),
    max(a)
FROM t
SETTINGS additional_table_filters = map('t', '0');

SELECT count()
FROM atf_p
SETTINGS additional_table_filters = map('atf_p', 'x <= 2');