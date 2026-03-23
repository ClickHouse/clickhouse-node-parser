SYSTEM drop  table if exists my_table;

SYSTEM drop  view if exists my_view;

CREATE TABLE my_table
(
    Id UInt32,
    Object Nested(Key UInt8, Value String)
)
ENGINE = MergeTree
ORDER BY Id;

CREATE VIEW my_view
AS
SELECT * REPLACE (arrayMap(x -> x + 1, `Object.Key`) AS `Object.Key`)
FROM my_table;

SYSTEM drop  table my_table;

SYSTEM drop  view my_view;