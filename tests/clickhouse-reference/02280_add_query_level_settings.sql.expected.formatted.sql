CREATE TABLE table_for_alter
(
    id UInt64,
    Data String
)
ENGINE = MergeTree()
ORDER BY id
SETTINGS parts_to_throw_insert = 1, parts_to_delay_insert = 1;