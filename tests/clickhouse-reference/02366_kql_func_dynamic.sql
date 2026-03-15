CREATE TABLE array_test (floats Array(Float64),
                         strings Array(String),
                         nullable_strings Array(Nullable(String))
                         ) ENGINE=Memory;
set allow_experimental_kusto_dialect=1;
set dialect = 'kusto';
