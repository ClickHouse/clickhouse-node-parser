-- Fixed only for analyzer
SET enable_analyzer=1;
CREATE VIEW test_view AS SELECT * FROM file(database() || '.test-data.json', JSON);
CREATE TABLE test_table_view (a String) Engine=Memory AS
    SELECT toString(numeric) FROM test_view;
SELECT COUNT(*) FROM test_table_view;
-- Same without View

CREATE TABLE test_table (a String) Engine=Memory AS
    SELECT toString(numeric) FROM (SELECT * FROM file(database() || '.test-data.json', JSON));
SELECT COUNT(*) FROM test_table;
