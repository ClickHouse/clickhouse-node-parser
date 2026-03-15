CREATE TEMPORARY TABLE temp_tab
(
    number UInt64
);

SELECT number
FROM temp_tab;

SET send_logs_level = 'fatal';

SET send_logs_level = 'warning';