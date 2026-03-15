CREATE TABLE 02581_trips(id UInt32, description String, id2 UInt32, PRIMARY KEY id) ENGINE=MergeTree ORDER BY id;
SELECT count() from 02581_trips WHERE description = '';
SELECT name FROM system.parts WHERE database=currentDatabase() AND table = '02581_trips' AND active ORDER BY name;
-- Wait for mutations to finish
SELECT count() FROM 02581_trips SETTINGS select_sequential_consistency = 1;
SELECT count(), _part from 02581_trips WHERE description = '' GROUP BY _part ORDER BY _part SETTINGS select_sequential_consistency=1;
SET max_rows_to_read = 0; -- system.text_log can be really big
