DROP TABLE IF EXISTS array_test;
CREATE TABLE array_test (floats Array(Float64),
                         strings Array(String),
                         nullable_strings Array(Nullable(String))
                         ) ENGINE=Memory;
INSERT INTO array_test VALUES([1.0, 2.5], ['a', 'c'], ['A', NULL, 'C']);
set allow_experimental_kusto_dialect=1;
set dialect = 'kusto';
