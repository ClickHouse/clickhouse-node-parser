CREATE TABLE t1 (key Int32, value DateTime) ENGINE = Log;
create table t2 ENGINE = Log as select key as key1, value from t1;
