SELECT count() FROM tab WHERE s LIKE '%Hello%' OR s LIKE '%hello%';
SELECT trim(explain) FROM
(
    EXPLAIN actions = 1 SELECT count() FROM tab WHERE s LIKE '%Hello%' OR s LIKE '%hello%' SETTINGS use_skip_indexes_on_data_read = 1
)
WHERE explain LIKE '%Filter column%';
SELECT count() FROM tab WHERE s LIKE 'Hello,%' OR s LIKE 'hello,%';
SELECT trim(explain) FROM
(
    EXPLAIN actions = 1, indexes = 1 SELECT count() FROM tab WHERE s LIKE 'Hello,%' OR s LIKE 'hello,%' SETTINGS use_skip_indexes_on_data_read = 1
)
WHERE explain LIKE '%Filter column%';
