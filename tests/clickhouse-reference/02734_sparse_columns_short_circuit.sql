SET short_circuit_function_evaluation = 'force_enable';
CREATE TABLE t_sparse_short_circuit (a UInt64, b UInt64)
ENGINE = MergeTree ORDER BY tuple()
SETTINGS ratio_of_defaults_for_sparse_serialization = 0.9;
SELECT sum(if(a % 10 = 0, CAST(b, 'UInt8'), 0)) FROM t_sparse_short_circuit;
