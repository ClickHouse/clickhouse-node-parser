SELECT DISTINCT
    h3PolygonToCells(ring, 7),
    arraySort(arrayMap(x -> h3ToString(x), h3PolygonToCells(ring, 7))) = reference
FROM rings;