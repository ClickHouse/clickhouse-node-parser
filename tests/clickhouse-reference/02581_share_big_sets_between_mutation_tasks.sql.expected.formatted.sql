CREATE TABLE `02581_trips`
(
    id UInt32,
    id2 UInt32,
    description String
)
ENGINE = MergeTree
ORDER BY id
SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';

-- { echoOn }
SELECT
    count(),
    _part
FROM `02581_trips`
GROUP BY _part
ORDER BY _part ASC;

SELECT
    count(),
    _part
FROM `02581_trips`
WHERE description = ''
GROUP BY _part
ORDER BY _part ASC;

SELECT count()
FROM `02581_trips`
WHERE description = '';