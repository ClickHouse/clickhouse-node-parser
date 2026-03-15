CREATE TABLE t (v Variant(Map(String, Int32), Tuple(String, Int32))) ENGINE = Memory;
SELECT * FROM t;
