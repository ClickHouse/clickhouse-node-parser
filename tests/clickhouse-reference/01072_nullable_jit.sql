SET compile_expressions = 1;
CREATE TABLE foo (
    id UInt32,
    a Float64,
    b Float64,
    c Float64,
    d Float64
) Engine = MergeTree()
  PARTITION BY id
  ORDER BY id;
SELECT divide(sum(a) + sum(b), nullIf(sum(c) + sum(d), 0)) FROM foo;
