CREATE TEMPORARY TABLE IF NOT EXISTS temporary_table
(
    column UInt32
)
ENGINE = Memory;

SELECT column
FROM temporary_table
ORDER BY column ASC;