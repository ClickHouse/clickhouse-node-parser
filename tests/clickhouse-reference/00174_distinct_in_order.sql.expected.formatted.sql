-- Tags: stateful
SELECT '-- check that distinct with and w/o optimization produce the same result';

CREATE TABLE distinct_in_order
(
    CounterID UInt32,
    EventDate Date
)
ENGINE = MergeTree()
ORDER BY (CounterID, EventDate)
SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';

CREATE TABLE ordinary_distinct
(
    CounterID UInt32,
    EventDate Date
)
ENGINE = MergeTree()
ORDER BY (CounterID, EventDate)
SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';

SELECT DISTINCT *
FROM distinct_in_order
EXCEPT
SELECT *
FROM ordinary_distinct;