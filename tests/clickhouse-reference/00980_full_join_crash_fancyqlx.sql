SELECT id, date, name FROM (SELECT id, date, name FROM test_join GROUP BY id, name, date) js1
FULL OUTER JOIN (SELECT id, date, name FROM test_join GROUP BY id, name, date) js2
USING (id, name, date)
ORDER BY id, name;
