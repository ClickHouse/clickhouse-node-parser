CREATE TABLE memory
(
    x UInt8
)
ENGINE = Memory;

SELECT *
FROM memory
ORDER BY x ASC;