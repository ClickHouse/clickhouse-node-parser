SET convert_query_to_cnf = 1;
CREATE TABLE cnf_test (i Int64) ENGINE = MergeTree() ORDER BY i;
