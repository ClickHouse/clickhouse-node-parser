CREATE TEMPORARY TABLE IF NOT EXISTS default_table
(
    x UInt32,
    y UInt32 DEFAULT 42,
    z UInt32 DEFAULT 33
)
ENGINE = Memory;

SELECT *
FROM default_table
ORDER BY x ASC;