SELECT 'ALL tmp_table_01818', count() FROM tmp_table_01818;
SELECT 'ALL main_table_01818', count() FROM main_table_01818;
SELECT 'tmp_table_01818', count() FROM tmp_table_01818 WHERE `advertiser_id` = 'ClickHouse';
SELECT 'main_table_01818', count() FROM main_table_01818 WHERE `advertiser_id` = 'ClickHouse';
