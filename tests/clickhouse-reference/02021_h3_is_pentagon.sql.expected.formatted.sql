CREATE TABLE h3_indexes
(
    h3_index UInt64
)
ENGINE = Memory;

SELECT h3IsPentagon(h3_index)
FROM h3_indexes
ORDER BY h3_index ASC;