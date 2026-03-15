CREATE TABLE h3_indexes
(
    h3_index UInt64
)
ENGINE = Memory;

SELECT round(h3ExactEdgeLengthKm(h3_index), 2)
FROM h3_indexes
ORDER BY h3_index ASC;