CREATE TABLE TestTbl
(
    `id` UInt16,
    `dt` Date,
    `val` String
)
ENGINE = MergeTree
PARTITION BY dt
ORDER BY (id);
CREATE VIEW TestTbl_view
AS
SELECT *
FROM TestTbl
WHERE dt = ( SELECT max(dt) FROM TestTbl );
CREATE DICTIONARY IF NOT EXISTS TestTblDict
(
    `id` UInt16,
    `dt` Date,
    `val` String
)
PRIMARY KEY id
SOURCE(CLICKHOUSE(TABLE TestTbl_view DB currentDatabase()))
LIFETIME(1)
LAYOUT(COMPLEX_KEY_HASHED());
select 'view' src,* FROM TestTbl_view;
select 'dict' src,* FROM TestTblDict ;
SELECT sleep(3) from numbers(4) settings max_block_size= 1 format Null;
