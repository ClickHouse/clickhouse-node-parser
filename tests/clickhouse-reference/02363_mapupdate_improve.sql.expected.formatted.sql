SELECT mapUpdate(mapFilter((k, v) -> (k IN ('fruit')), tags), map('season', 'autumn'))
FROM map_test;

SELECT mapUpdate(map('season', 'autumn'), mapFilter((k, v) -> (k IN ('fruit')), tags))
FROM map_test;