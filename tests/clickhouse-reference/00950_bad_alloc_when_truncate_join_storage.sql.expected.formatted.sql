CREATE TABLE join_test
(
    number UInt8,
    value Float32
)
ENGINE = Join(`ANY`, `LEFT`, number);