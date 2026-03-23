CREATE TEMPORARY TABLE temp_tab (number UInt64);
INSERT INTO temp_tab SELECT number FROM system.numbers LIMIT 1;
SELECT number FROM temp_tab;
SET send_logs_level = 'fatal';
SET send_logs_level = 'warning';
