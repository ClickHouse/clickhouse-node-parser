CREATE TABLE TestTbl
(
    id UInt16,
    dt Date,
    val String
)
ENGINE = MergeTree
ORDER BY (id)
PARTITION BY dt;

CREATE VIEW TestTbl_view
AS
SELECT *
FROM TestTbl
WHERE dt = (
        SELECT max(dt)
        FROM TestTbl
    );

CREATE DICTIONARY IF NOT EXISTS TestTblDict
(
    id UInt16,
    dt Date,
    val String
)
PRIMARY KEY id
SOURCE(clickhouse(TABLE TestTbl_view DB currentDatabase()))
LIFETIME(1)
LAYOUT(COMPLEX_KEY_HASHED());

SELECT
    'view' AS src,
    *
FROM TestTbl_view;

SELECT
    'dict' AS src,
    *
FROM TestTblDict;

SELECT sleep(3)
FROM numbers(4)
SETTINGS max_block_size = 1
FORMAT Null;