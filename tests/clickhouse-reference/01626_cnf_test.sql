SET convert_query_to_cnf = 1;
DROP TABLE IF EXISTS cnf_test;
CREATE TABLE cnf_test (i Int64) ENGINE = MergeTree() ORDER BY i;
DROP TABLE cnf_test;
