CREATE TABLE nullable_00457 (s String, ns Nullable(String), narr Array(Nullable(UInt64))) ENGINE = Log;
SELECT * FROM nullable_00457 ORDER BY s;
SELECT s FROM nullable_00457 ORDER BY s;
SELECT ns FROM nullable_00457 ORDER BY s;
SELECT narr FROM nullable_00457 ORDER BY s;
SELECT s, narr FROM nullable_00457 ORDER BY s;
CREATE TABLE nullable_00457 (s String, ns Nullable(String), narr Array(Nullable(UInt64))) ENGINE = TinyLog;
CREATE TABLE nullable_00457 (s String, ns Nullable(String), narr Array(Nullable(UInt64))) ENGINE = StripeLog;
