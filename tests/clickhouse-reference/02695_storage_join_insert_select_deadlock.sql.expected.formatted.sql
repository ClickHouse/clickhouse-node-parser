CREATE TABLE test_table_join
(
    id UInt64,
    value String
)
ENGINE = Join(`Any`, `Left`, id);