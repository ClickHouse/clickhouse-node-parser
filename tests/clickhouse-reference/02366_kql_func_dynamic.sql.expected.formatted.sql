CREATE TABLE array_test
(
    floats Array(Float64),
    strings Array(String),
    nullable_strings Array(Nullable(String))
)
ENGINE = Memory;

INSERT INTO array_test;

SET allow_experimental_kusto_dialect = 1;

SET dialect = 'kusto';