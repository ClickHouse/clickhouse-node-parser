CREATE TABLE join_table_mutation(id Int32, name String) ENGINE = Join(ANY, LEFT, id);
SELECT count() FROM join_table_mutation;
SELECT name FROM join_table_mutation WHERE id = 10;
