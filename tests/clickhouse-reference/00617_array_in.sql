CREATE TABLE test_array_ops(arr Array(Nullable(Int64))) ENGINE = Memory;
SELECT count(*) FROM test_array_ops where arr < CAST([10, -20] AS Array(Nullable(Int64)));
SELECT count(*) FROM test_array_ops where arr > CAST([10, -20] AS Array(Nullable(Int64)));
SELECT count(*) FROM test_array_ops where arr >= CAST([10, -20] AS Array(Nullable(Int64)));
SELECT count(*) FROM test_array_ops where arr <= CAST([10, -20] AS Array(Nullable(Int64)));
SELECT count(*) FROM test_array_ops where arr = CAST([10, -20] AS Array(Nullable(Int64)));
SELECT count(*) FROM test_array_ops where arr IN( CAST([10, -20] AS Array(Nullable(Int64))), CAST([null,10, -20] AS Array(Nullable(Int64))));
