DROP TABLE IF EXISTS join_test;

CREATE TABLE join_test
(
    number UInt8,
    value Float32
)
ENGINE = Join(`ANY`, `LEFT`, number);