CREATE TABLE where_qualified
(
    a UInt32,
    b UInt8
)
ENGINE = Memory;

SELECT a
FROM where_qualified
WHERE where_qualified.b;