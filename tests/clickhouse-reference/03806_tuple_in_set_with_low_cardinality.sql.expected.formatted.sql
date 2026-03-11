SELECT (1, 2) IN ([(1, 2), toLowCardinality(1), NULL])
SETTINGS enable_analyzer = 1;

SELECT (1, 2) IN ([(1, 2), toLowCardinality(1), NULL])
SETTINGS enable_analyzer = 0;

SELECT (1, 2) IN ((1, 2), 1);

SELECT (1, 2) IN ([(1, 2), (3, 4)]);

SELECT (1, 2) IN ((1, 2), (3, 4));

SELECT tuple(1, 2) IN (tuple(1, 2), tuple(3, 4));

SELECT (1, 2)::Nullable(Tuple(Int32, Int32)) IN ((1, 2), (3, 4));

SELECT (1, 2)::Nullable(Tuple(Int32, Int32)) IN ((1, 2), NULL);