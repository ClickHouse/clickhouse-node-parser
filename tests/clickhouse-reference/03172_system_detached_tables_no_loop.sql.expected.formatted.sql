SELECT '-----------------------';

SELECT count(*)
FROM `system`.detached_tables
WHERE database = 'test_no_loop';

SELECT count(*)
FROM `system`.detached_tables
WHERE database = 'test_no_loop_2';