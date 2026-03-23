CREATE TABLE 02581_trips(id UInt32, description String, id2 UInt32, PRIMARY KEY id) ENGINE=MergeTree ORDER BY id;
-- Make multiple parts
INSERT INTO 02581_trips SELECT number, '', number FROM numbers(10000);
INSERT INTO 02581_trips SELECT number+10000000, '', number FROM numbers(10000);
INSERT INTO 02581_trips SELECT number+20000000, '', number FROM numbers(10000);
INSERT INTO 02581_trips SELECT number+30000000, '', number FROM numbers(10000);
SELECT count() from 02581_trips WHERE description = '';
SELECT name FROM system.parts WHERE database=currentDatabase() AND table = '02581_trips' AND active ORDER BY name;
-- Wait for mutations to finish
SELECT count() FROM 02581_trips SETTINGS select_sequential_consistency = 1;
SELECT count(), _part from 02581_trips WHERE description = '' GROUP BY _part ORDER BY _part SETTINGS select_sequential_consistency=1;
SET max_rows_to_read = 0; -- system.text_log can be really big
