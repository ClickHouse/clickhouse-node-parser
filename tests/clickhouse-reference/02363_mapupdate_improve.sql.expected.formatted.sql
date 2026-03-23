CREATE TABLE map_test
(
    tags Map(String, String)
)
ENGINE = MergeTree
PRIMARY KEY tags
ORDER BY tags
SETTINGS index_granularity = 8192;

INSERT INTO map_test (tags);

SELECT mapUpdate(mapFilter((k, v) -> (k IN ('fruit')), tags), map('season', 'autumn'))
FROM map_test;

SELECT mapUpdate(map('season', 'autumn'), mapFilter((k, v) -> (k IN ('fruit')), tags))
FROM map_test;