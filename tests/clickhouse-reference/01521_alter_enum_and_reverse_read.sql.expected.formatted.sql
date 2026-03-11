SELECT *
FROM enum_test
ORDER BY
    timestamp ASC,
    e DESC
SETTINGS optimize_read_in_order = 1;