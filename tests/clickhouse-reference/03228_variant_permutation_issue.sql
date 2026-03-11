SELECT * FROM test_new_json_type FINAL WHERE data.foo2 is not null ORDER BY id;
SELECT * FROM test_new_json_type FINAL PREWHERE data.foo2 IS NOT NULL WHERE data.foo2 IS NOT NULL ORDER BY id ASC NULLS FIRST;
