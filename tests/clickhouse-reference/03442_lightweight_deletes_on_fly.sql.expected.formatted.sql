SELECT a
FROM test_deletes
SETTINGS apply_mutations_on_fly = 1;

SELECT count()
FROM test_deletes
SETTINGS apply_mutations_on_fly = 1;