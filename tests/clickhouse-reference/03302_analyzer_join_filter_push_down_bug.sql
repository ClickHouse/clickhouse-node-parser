CREATE TABLE t1 (key Int32, value DateTime) ENGINE = Log;
INSERT INTO  t1 select number, number from numbers(10000);
create table t2 ENGINE = Log as select key as key1, value from t1;
