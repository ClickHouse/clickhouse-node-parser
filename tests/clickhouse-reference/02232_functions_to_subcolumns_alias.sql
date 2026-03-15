CREATE TABLE t_functions_to_subcolumns_alias (id UInt64, t Tuple(UInt64, String), m Map(String, UInt64)) ENGINE = Memory;
SELECT count(id) AS cnt FROM t_functions_to_subcolumns_alias FORMAT TSVWithNames;
SELECT tupleElement(t, 1) as t0, t0 FROM t_functions_to_subcolumns_alias FORMAT TSVWithNames;
SELECT mapContains(m, 'foo') AS hit FROM t_functions_to_subcolumns_alias FORMAT TSVWithNames;
