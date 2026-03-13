-- excpect 2 rows, because Memory engine does not support deduplication
SELECT count()
FROM `03720_table`;