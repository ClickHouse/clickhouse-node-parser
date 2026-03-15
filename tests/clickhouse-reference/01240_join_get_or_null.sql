CREATE TABLE join_test (id UInt16, num UInt16) engine = Join(ANY, LEFT, id);
SELECT joinGetOrNull('join_test', 'num', 500);
CREATE TABLE join_test (id UInt16, num Nullable(UInt16)) engine = Join(ANY, LEFT, id);
CREATE TABLE join_test (id UInt16, num Array(UInt16)) engine = Join(ANY, LEFT, id);
create table test (x Date, y String) engine Join(ANY, LEFT, x);
