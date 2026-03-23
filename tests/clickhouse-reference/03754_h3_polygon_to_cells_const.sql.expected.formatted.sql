CREATE TABLE rings
(
    ring Ring,
    reference Array(String)
)
ENGINE = MergeTree
ORDER BY tuple();

INSERT INTO rings SELECT
    [(-122.40898669999721, 37.81331899998324), (-122.35447369999936, 37.71980619999785), (-122.4798767000009, 37.815157199999845)],
    ['872830820ffffff', '872830828ffffff', '87283082affffff', '87283082bffffff', '87283082effffff', '872830870ffffff', '872830876ffffff']
FROM numbers(10000);

SELECT DISTINCT
    h3PolygonToCells(ring, 7),
    arraySort(arrayMap(x -> h3ToString(x), h3PolygonToCells(ring, 7))) = reference
FROM rings;