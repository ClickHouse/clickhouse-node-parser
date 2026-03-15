CREATE TABLE nested (x UInt8, n Nested(a UInt64, b String)) ENGINE = TinyLog;
SELECT * FROM nested ORDER BY x;
SELECT x, n.a FROM nested ORDER BY x;
SELECT n.a, n.b FROM nested ORDER BY n.a;
CREATE TABLE nested (x UInt8, n Nested(a UInt64, b String)) ENGINE = Log;
CREATE TABLE nested (x UInt8, n Nested(a UInt64, b String)) ENGINE = StripeLog;
CREATE TABLE nested (x UInt8, n Nested(a UInt64, b String)) ENGINE = Memory;
CREATE TABLE nested (x UInt8, n Nested(a UInt64, b String)) ENGINE = MergeTree ORDER BY x;
