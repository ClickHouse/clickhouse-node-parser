SELECT mapUpdate(mapFilter((k, v) -> (k in ('fruit')), tags), map('season', 'autumn')) FROM map_test;
SELECT mapUpdate(map('season','autumn'), mapFilter((k, v) -> (k in ('fruit')), tags)) FROM map_test;
