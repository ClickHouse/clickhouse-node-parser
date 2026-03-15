CREATE TABLE rings
(
    ring Ring,
    reference Array(String)
)
ENGINE = MergeTree
ORDER BY tuple();

SELECT DISTINCT
    h3PolygonToCells(ring, 7),
    arraySort(arrayMap(x -> h3ToString(x), h3PolygonToCells(ring, 7))) = reference
FROM rings;