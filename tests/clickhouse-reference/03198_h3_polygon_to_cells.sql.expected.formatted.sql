-- Tags: no-fasttest
-- example from h3 docs
SELECT arraySort(arrayMap(x -> h3ToString(x), h3PolygonToCells([(-122.4089866999972145,37.813318999983238),(-122.3544736999993603,37.7198061999978478),(-122.4798767000009008,37.8151571999998453)], 7))) = ['872830820ffffff','872830828ffffff','87283082affffff','87283082bffffff','87283082effffff','872830870ffffff','872830876ffffff'];

-- expected: '8b63a9a9914cfff','8b63a9a99168fff', '8b63a9a99bb3fff'
SELECT arraySort(arrayMap(x -> h3ToString(x), h3PolygonToCells(ring, 11))) = ['8b63a9a9914cfff','8b63a9a99168fff','8b63a9a9916afff']
FROM rings;

SELECT arraySort(arrayMap(x -> h3ToString(x), h3PolygonToCells(polygon, 11))) = ['8b63a9a9914cfff','8b63a9a99168fff']
FROM polygons;

SELECT arraySort(arrayMap(x -> h3ToString(x), h3PolygonToCells(multipolygon, 11))) = ['8b63a9a9914cfff','8b63a9a99168fff','8b63a9a99bb3fff']
FROM multipolygons;