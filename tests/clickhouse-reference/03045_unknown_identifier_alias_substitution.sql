-- https://github.com/ClickHouse/ClickHouse/issues/23053
SET enable_analyzer=1;
CREATE TEMPORARY TABLE repl_tbl
(
    `key` UInt32,
    `val_1` UInt32,
    `val_2` String,
    `val_3` String,
    `val_4` String,
    `val_5` UUID,
    `ts` DateTime
)
ENGINE = ReplacingMergeTree(ts)
ORDER BY `key`;
set prefer_column_name_to_alias = 1;
