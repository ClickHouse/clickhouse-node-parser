SELECT '-- Assert total number of groups and records in unsorted';
SELECT uniqExact(id), count() FROM 03408_unsorted;
SELECT id, val FROM 03408_unsorted ORDER BY id, val LIMIT 1 BY id LIMIT 3
FORMAT JsonCompact SETTINGS max_block_size=1, exact_rows_before_limit=0;
SELECT id, val FROM 03408_unsorted ORDER BY id, val LIMIT 1 BY id LIMIT 3
FORMAT JsonCompact SETTINGS max_block_size=1, exact_rows_before_limit=1;
SELECT id, val FROM 03408_unsorted GROUP BY id, val HAVING id < 7 ORDER BY id, val DESC LIMIT 1 BY id LIMIT 3
FORMAT JsonCompact SETTINGS max_block_size=1, exact_rows_before_limit=1;
SELECT uniqExact(id), count() FROM 03408_sorted;
SELECT id, val FROM 03408_sorted ORDER BY id, val LIMIT 1 BY id LIMIT 3
FORMAT JsonCompact SETTINGS max_block_size=1, exact_rows_before_limit=0;
SELECT id, val FROM 03408_sorted ORDER BY id, val LIMIT 1 BY id LIMIT 3
FORMAT JsonCompact SETTINGS max_block_size=1, exact_rows_before_limit=1;
SELECT id, val FROM 03408_sorted GROUP BY id, val HAVING id < 7 ORDER BY id, val DESC LIMIT 1 BY id LIMIT 3
FORMAT JsonCompact SETTINGS max_block_size=1, exact_rows_before_limit=1;
