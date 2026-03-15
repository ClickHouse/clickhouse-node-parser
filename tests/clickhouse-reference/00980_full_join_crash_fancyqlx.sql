create table test_join (date Date, id Int32, name Nullable(String)) engine = MergeTree partition by date order by id;
SELECT id, date, name FROM (SELECT id, date, name FROM test_join GROUP BY id, name, date) js1
FULL OUTER JOIN (SELECT id, date, name FROM test_join GROUP BY id, name, date) js2
USING (id, name, date)
ORDER BY id, name;
