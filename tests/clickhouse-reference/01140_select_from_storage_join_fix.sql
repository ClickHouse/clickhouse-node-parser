CREATE TABLE t1 (id String, name String, value UInt32)
ENGINE = Join(ANY, LEFT, id)
SETTINGS join_use_nulls = 1;
CREATE TABLE t2 (id String, name String, value UInt32)
ENGINE = Join(ANY, LEFT, id)
SETTINGS join_use_nulls = 0;
CREATE TABLE t3 (id Nullable(String), name String, value UInt32)
ENGINE = Join(ANY, LEFT, id)
SETTINGS join_use_nulls = 1;
CREATE TABLE t4 (id String, name Nullable(String), value UInt32)
ENGINE = Join(ANY, LEFT, id)
SETTINGS join_use_nulls = 0;
select *, toTypeName(id), toTypeName(name) from t1;
select *, toTypeName(id), toTypeName(name) from t2;
select *, toTypeName(id), toTypeName(name) from t3;
select *, toTypeName(id), toTypeName(name) from t4;
SET join_use_nulls = 1;
