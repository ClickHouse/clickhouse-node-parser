SELECT 1
FROM visits
ARRAY JOIN arrayFilter(t -> 1, arrayMap(x -> tuple(x), [42])) AS i
WHERE ((str, i.1) IN ('x', 0));
