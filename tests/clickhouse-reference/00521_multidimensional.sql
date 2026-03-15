CREATE TABLE multidimensional (x UInt64, arr Array(Array(String))) ENGINE = MergeTree ORDER BY x;
SELECT * FROM multidimensional;
SELECT * FROM multidimensional ORDER BY t;
CREATE TABLE multidimensional (x UInt64, arr Array(Array(String)), t Tuple(String, Array(Nullable(String)), Tuple(UInt32, Date))) ENGINE = Memory;
CREATE TABLE multidimensional (x UInt64, arr Array(Array(String)), t Tuple(String, Array(Nullable(String)), Tuple(UInt32, Date))) ENGINE = TinyLog;
CREATE TABLE multidimensional (x UInt64, arr Array(Array(String)), t Tuple(String, Array(Nullable(String)), Tuple(UInt32, Date))) ENGINE = StripeLog;
CREATE TABLE multidimensional (x UInt64, arr Array(Array(String)), t Tuple(String, Array(Nullable(String)), Tuple(UInt32, Date))) ENGINE = Log;
