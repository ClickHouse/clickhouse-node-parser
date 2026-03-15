CREATE TABLE test
(
    a String,
    alias_col_a String ALIAS a
)
ENGINE = MergeTree
ORDER BY a;

SELECT hasColumnInTable(currentDatabase(), 'test', 'alias_col_a');